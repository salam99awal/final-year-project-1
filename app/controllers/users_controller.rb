class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]


 def index
   @users = User.all
   
 end


 def teachers_lists
  # @users = User.joins("INNER JOIN class_fields on class_fields.id = users.class_id").select("users.id,full_name,class_fields.name").where(role_id: 2)

    @users = User.where(role_id: 2)

  
 end



 # GET /users/1
 # GET /users/1.json
 def show
 end

 # GET /users/new
 def new
   @user = User.new
 end

 # GET /users/1/edit
 def edit
 end

 # POST /users
 # POST /users.json
 def create
  @username = params[:user][:username]
  @email = params[:user][:email]
  @password = params[:user][:password]
  @full_name = params[:user][:full_name]
  @password_confirmation = params[:user][:password_confirmation]
  @role_id = params[:user][:role_id]
  @status = params[:user][:status]
  @subject_master_id = params[:user][:subject_master_id]
  @class_id = params[:user][:class_id]

  @user = User.new(username:@username, email:@email,password: @password,full_name:@full_name,password_confirmation:@password_confirmation, role_id: @role_id,
  subject_master_id:@subject_master_id)
  @user.save


  if @class_id.nil?
    logger.info "class id nill"
  else
  @class_id.each do |key|
   
    @user.user_classes.create(class_id: key)
  end

  end



   respond_to do |format|
     if @user.save
       format.html { redirect_to users_path, notice: 'Users was successfully created.' }
       format.json { render :show, status: :created, location: @user }
     else
 format.html { render :new }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
 end

 # PATCH/PUT /users/1
 # PATCH/PUT /users/1.json
def update
  @username = params[:user][:username]
  @email = params[:user][:email]
  @password = params[:user][:password]
  @full_name = params[:user][:full_name]
  @password_confirmation = params[:user][:password_confirmation]
  @role_id = params[:user][:role_id]
  @status = params[:user][:status]
  @subject_master_id = params[:user][:subject_master_id]
  @class_id = params[:user][:class_id]
  user_id = params[:user][:id]

  
   respond_to do |format|
     if @user.update(username:@username, email:@email,password: @password,full_name:@full_name,password_confirmation:@password_confirmation, role_id: @role_id,
      subject_master_id:@subject_master_id)

      


       if @class_id.nil?
    logger.info "class id nill"
  else
  @class_id.each do |key|
   
 @user.user_classes.create(class_id: key,user_id: user_id)
  end

  end

      
       format.html { redirect_to users_path, notice: 'Users was successfully updated.' }
       format.json { render :show, status: :ok, location: @user }
     else
       format.html { render :edit }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
 end

 # DELETE /users/1
 # DELETE /users/1.json
 def destroy
   @user.destroy
   respond_to do |format|
     format.html { redirect_to users_path, notice: 'Users was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 


private
   # Use callbacks to share common setup or constraints between actions.
   def set_user
     @user = User.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def user_params
   params.require(:user).permit(:username,:email, :password, :full_name,:password_confirmation,:role_id ,:status,:subject_master_id,:class_id)
   end
end

