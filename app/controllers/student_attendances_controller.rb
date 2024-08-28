class StudentAttendancesController < ApplicationController
  before_action :set_student_attendance, only: %i[ show edit update destroy ]

  # GET /student_attendances or /student_attendances.json
  def index
    #@student_attendances = StudentAttendance.all

 @student_attendance = StudentAttendance.new

      @users = UserClass.joins("INNER JOIN users on users.id = user_classes.user_id INNER JOIN class_fields on class_fields.id = user_classes.class_id").select("user_classes.id,full_name,username,name,email,subject_master_id,user_classes.class_id,user_classes.user_id").where(user_id: current_user.id)
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

      @students = Student.where(class_id: @class_id)

          if @users.present?

       logger.info "RUNINNN PRESENT---->>"
      @user2_id = User.find_by(id: @user_id)
      logger.info "user2 #{@user2_id.inspect}"
       logger.info "class id #{@class_id}"
       @subject_id = @user2_id.subject_master_id
       logger.info "info subject#{@subject_id}"
      @students = Student.where(class_id: @class_id)
      logger.info "this is a student#{@students.inspect}"
    else
    logger.info "NOT--->>>RUNINNN PRESENT---->>"
    @user = User.find_by(id: current_user.id)
    @subject_master_id = @user.subject_master_id
    @students = Student.where(class_id: @subject_master_id)
    end

  end


  def today_attendance

       @student_attendances = StudentAttendance.joins("INNER JOIN students on students.id = student_attendances.student_id INNER JOIN class_fields on class_fields.id = student_attendances.class_id").select("student_attendances.id,first_name,last_name,class_fields.name,present_status").where(user_id: current_user.id,created_at:Date.today.beginning_of_day..Date.today.end_of_day)

  end

  # GET /student_attendances/1 or /student_attendances/1.json
  def show
  end

  # GET /student_attendances/new
  def new
    @student_attendance = StudentAttendance.new
  end

  # GET /student_attendances/1/edit
  def edit
  end

  # POST /student_attendances or /student_attendances.json
  def create
   # @student_attendance = StudentAttendance.new(student_attendance_params)

    student_id = params[:check_box][:id]

     student_id.each do | value |

      param_obj = Student.find(value)   

      class_id = param_obj.class_id

      save_attendance = StudentAttendance.new(student_id: value, class_id: class_id, present_status: true, user_id: current_user.id)
      save_attendance.save

     end

     respond_to do |format|
      format.html { redirect_to today_attendance_path, notice: "Student attendance was successfully created." }
     end


    # respond_to do |format|
    #   if @student_attendance.save
    #     format.html { redirect_to student_attendance_url(@student_attendance), notice: "Student attendance was successfully created." }
    #     format.json { render :show, status: :created, location: @student_attendance }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @student_attendance.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /student_attendances/1 or /student_attendances/1.json
  def update
    respond_to do |format|
      if @student_attendance.update(student_attendance_params)
        format.html { redirect_to student_attendance_url(@student_attendance), notice: "Student attendance was successfully updated." }
        format.json { render :show, status: :ok, location: @student_attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_attendances/1 or /student_attendances/1.json
  def destroy
    @student_attendance.destroy

    respond_to do |format|
      format.html { redirect_to student_attendances_url, notice: "Student attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_attendance
      @student_attendance = StudentAttendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_attendance_params
      params.require(:student_attendance).permit(:student_id, :class_id, :present_status, :user_id)
    end
end
