class HomeController < ApplicationController
  def homepage

    if current_user.role_id == 1
    @classes = ClassField.all
    else
      # @classes = ClassField.all #Will delete later

       @users = UserClass.joins("INNER JOIN users on users.id = user_classes.user_id INNER JOIN class_fields on class_fields.id = user_classes.class_id")
       .select("user_classes.id,full_name,username,name,email,subject_master_id,user_classes.class_id,user_classes.user_id").where(user_id: current_user.id)
    classs_id = params[:id]
    logger.info "user is #{@users.inspect}"
    @class_id =[]
    @users.each do |user|
    @class_id << user.class_id
    @user_id = user.user_id
    end
    logger.info "this is user #{@user_id}"



      logger.info "-----Teacher Profile---------"

      logger.info "#{current_user.role_id}"

      @students = Subject.where(class_id: @class_id)

          if @users.present?

       logger.info "RUNINNN PRESENT---->>"
      @user2_id = User.find_by(id: @user_id)
      logger.info "user2 #{@user2_id.inspect}"
       logger.info "class id #{@class_id}"
       @subject_id = @user2_id.subject_master_id
       logger.info "info subject#{@subject_id}"
      @students = Subject.joins("INNER join subject_masters on subject_masters.id = subjects.subject_master_id
      INNER join class_fields on class_fields.id = subjects.class_id")
      .select("subject_masters.name as name,subject_masters.id as id,subjects.class_id as class_id,class_fields.name as class_name").where(class_id: @class_id)
    else
    logger.info "NOT--->>>RUNINNN PRESENT---->>"
    @user = User.find_by(id: current_user.id)
    @subject_master_id = @user.subject_master_id
    @students = Subject.where(class_id: @class_id)
    end

    end



    #SEARCHING FOR STUDENTS
    @student = Student.new

    if getParams = params[:student].present?
    getParams = params[:student][:first_name] 
    logger.info "PARAMS --- #{getParams}"
    @students = Student.joins("INNER JOIN class_fields On class_fields.id = students.class_id").select('students.id,class_id,first_name, last_name, name,religion,date_of_birth,gender').where("first_name like :getParams OR last_name like :getParams", getParams: "%#{getParams}%" )

    if @students.present?
     logger.info "students CLAAS ID --- #{@students[0].class_id}"
     redirect_to "/home/index?id=#{@students[0].class_id}"
    else
       logger.info "NO STUDENT AVAILBALE"
        respond_to do |format|
     
        format.html { redirect_to "/", notice: "No Students Available." }
     
    end
    end
    end
  end


  

  def index


    @users = UserClass.joins("INNER JOIN users on users.id = user_classes.user_id INNER JOIN class_fields on class_fields.id = user_classes.class_id").select("user_classes.id,full_name,username,name,email,subject_master_id,user_classes.class_id,user_classes.user_id").where(user_id: current_user.id)
    classs_id = params[:id]
    @class_id = classs_id
    logger.info "user is #{@users.inspect}"
    @class_id =[]
    @users.each do |user|
    @class_id << user.class_id
    @user_id = user.user_id
    end
    logger.info "this is user #{@user_id}"


    if current_user.role_id == 1

      logger.info "-----Admin Profile---------"

        if @users.present?

       logger.info "RUNINNN PRESENT---->>"
      @user2_id = User.find_by(id: @user_id)
      logger.info "user2 #{@user2_id.inspect}"
       logger.info "class id #{@class_id}"
       @subject_id = @user2_id.subject_master_id
       logger.info "info subject#{@subject_id}"
     @students = Student.where(:class_id => classs_id)
      logger.info "this is a student#{@students.inspect}"
    else
    logger.info "NOT--->>>RUNINNN PRESENT---->>"
    @user = User.find_by(id: current_user.id)
    @subject_master_id = @user.subject_master_id
   @students = Student.where(:class_id => classs_id)
    end

    else

      logger.info "-----Teacher Profile---------"

      logger.info "#{current_user.role_id}"

      @students = Student.all

          if @users.present?

       logger.info "RUNINNN PRESENT---->>"
      @user2_id = User.find_by(id: @user_id)
      logger.info "user2 #{@user2_id.inspect}"
       logger.info "class id #{@class_id}"
       @subject_id = @user2_id.subject_master_id
       logger.info "info subject#{@subject_id}"
      @students = SubjectMaster.all
      logger.info "this is a student#{@students.inspect}"
    else
    logger.info "NOT--->>>RUNINNN PRESENT---->>"
    @user = User.find_by(id: current_user.id)
    @subject_master_id = @user.subject_master_id
    @students = SubjectMaster.all
    end

    end




  end



  def uploadmisc
		@misc_upload = MiscUpload.new

      user_id = params[:id]
     if user_id
       	@misc_uploads= MiscUpload.joins("INNER JOIN users ON users.id  = misc_uploads.user_id
		").select('misc_uploads.id,full_name, misc_uploads.created_at').where(user_id: user_id).order('misc_uploads.created_at desc')
     else
     	@misc_uploads= MiscUpload.joins("INNER JOIN users ON users.id  = misc_uploads.user_id
		").select('misc_uploads.id,full_name, misc_uploads.created_at').where(user_id: current_user.id).order('misc_uploads.created_at desc')
     end
		
	
		
	
	end

	def uploadingmisc
		@misc_upload = MiscUpload.new
		@patient_id =params[:id]
		logger.info "patient id  :#{@patient_id.inspect} " 
		logger.info "current user  :#{current_user.id} " 

	end
end
