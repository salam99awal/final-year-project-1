class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]
   protect_from_forgery with: :null_session, only: [:create]

  # GET /lessons or /lessons.json
  def index
    @misc_upload = MiscUpload.new
     @lesson = Lesson.new
      @note_upload = NoteUpload.new

     @user_id = params[:user_id]
     @subject_id = params[:subject_id]

      @sub_chosen = SubjectMaster.where(id: @subject_id)
      @teacher_name = User.where(id: @user_id )

      logger.info "SUBJECT CHOSES IN NEW FORM #{@subject_id}"
      logger.info "USER ID IN LESSON INDEX #{@user_id}"

     if @user_id
        @users = User.where(id: @user_id)
       @lessons = Lesson.where(user_id: @user_id, subject_id: @subject_id)
      #  @lessons =  Lesson.joins("INNER JOIN misc_uploads ON misc_uploads.lesson_id  = lessons.id ").select("title,objectives,procedures,duration,status,lessons.id.misc_uploads.id as misc_id").where(user_id: user_id, subject_id: @subject_id)
     else
      @users = User.where(id: current_user.id)
    @lessons = Lesson.where(user_id: current_user.id, subject_id: @subject_id)
    #  @lessons =  Lesson.joins("INNER JOIN misc_uploads ON misc_uploads.lesson_id  = lessons.id ").select("title,objectives,procedures,duration,status,lessons.id,misc_uploads.id as misc_id").where(user_id: current_user.id, subject_id: @subject_id)
     end
  end
  

def teachers_attendance
     @t_attendance = Lesson.joins("INNER JOIN users on users.id = lessons.user_id INNER JOIN class_fields on class_fields.id = users.class_id").select("full_name,class_fields.name").where(attendance_status: true,updated_at:Date.today.beginning_of_day..Date.today.end_of_day)
 end


 def subject_list
   @user_id = params[:id]
   logger.info "USER ID IN SUBJECT LIST #{@user_id}"
     if @user_id
        @subjects = SubjectMaster.all
     else
  @subjects = SubjectMaster.all
     end
 end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @subject_id = params[:subject_id]
     @user_id = params[:user_id]

    logger.info "SUBJECT CHOSES IN NEW FORM #{@subject_id}"
     logger.info "USER ID IN FORM #{@user_id}"
  end

  # GET /lessons/1/edit
  def edit
     @subject_id = params[:subject_id]
      @user_id = params[:user_id]
  end

  def teaching
      @lesson = Lesson.new
    @lesson_id = params[:id]
    @subject_id = params[:subject_id]

    logger.info "SUBSJECT ID IN TEACHING  #{@subject_id}"
        @lessons = Lesson.where(id: @lesson_id )

  #  @lessons =  NoteUpload.select("id,lesson_id,objectives,duration_after_teaching,status,subject_id,title").where(lesson_id: @lesson_id, subject_id: @subject_id)
  end

  def record_activity
    @lesson_id = params[:id]
     @subject_id = params[:subject_id]

     logger.info "SUBSJECT ID IN RECORD ACTIBIN  #{@subject_id}"
     @lesson = Lesson.new
  end

  def record_activity_post

    id = params[:lesson][:id]
     assesments = params[:lesson][:assesments]
     remarks = params[:lesson][:remarks]
     @subject_id = params[:lesson][:subject_id]
     @lesson = Lesson.new

     Lesson.where(id: id).update_all(assesments: assesments,remarks: remarks )

      respond_to do |format|
        format.html { redirect_to lessons_path(subject_id:  @subject_id,user_id: current_user.id), notice: "Lesson was successfully created." }
      end
  end

  def lesson_details
       lesson_id = params[:id]
        @lessons = Lesson.where(id:lesson_id )

  end

  def update_teaching
    lesson_id = params[:lesson_id]
    teaching_time = params[:teaching_time]
    teaching_staus = params[:teaching_staus]
    time_lesson_ended = params[:time_lesson_ended]

    # Lesson.update(lesson_id, :status => teaching_staus, :duration_after_teaching => teaching_time)
    Lesson.where(id: lesson_id).update_all(status: teaching_staus,duration_after_teaching: teaching_time,time_lesson_ended: time_lesson_ended, attendance_status: true)

    #  respond_to do |format|
    # format.html { redirect_to teaching_path(:id => lesson_id), notice: "Teaching Ended Succesfully." }
    #  end
  end


  #   def uploadmisc
	# 	@misc_upload = MiscUpload.new

  #     user_id = params[:id]
  #    if user_id
  #      	@misc_uploads= MiscUpload.joins("INNER JOIN users ON users.id  = misc_uploads.user_id
	# 	").select('misc_uploads.id,full_name, misc_uploads.created_at').where(user_id: user_id).order('misc_uploads.created_at desc')
  #    else
  #    	@misc_uploads= MiscUpload.joins("INNER JOIN users ON users.id  = misc_uploads.user_id
	# 	").select('misc_uploads.id,full_name, misc_uploads.created_at').where(user_id: current_user.id).order('misc_uploads.created_at desc')
  #    end
		
	
		
	
	# end

	def uploadingNotes
		@lesson = Lesson.new
    @note_upload = NoteUpload.new
		@lesson_id =params[:id]
    @subject_id =params[:subject_id]
		logger.info "Lesson id  :#{@lesson_id} " 
		logger.info "current user  :#{current_user.id} " 

	end


  def view_uploadingNotes

    logger.info "<<><><><><>>>><><<><><><><>>>><><<><><><><>>>><>RUNNINGGG VIEWW UPLOAD <<><><><><>>>><>"
    	@lesson_id =params[:id]
    @subject_id =params[:subject_id]

   @lessons =  NoteUpload.select("id,lesson_id").where(lesson_id: @lesson_id, subject_id: @subject_id)

  
  end

  def update_lesson
    lesson_id=params[:lesson][:lesson_id]
    user_id = params[:lesson][:user_id]
     subject_id = params[:lesson][:subject_id]

     respond_to do |format|
  
      Lesson.where(id: lesson_id).update_all(avafile: params[:lesson][:avafile])
    format.html { redirect_to  lessons_path(subject_id:  subject_id, user_id: user_id), notice: 'Lesson Plan was succesfully uploaded.' }
    end
  end

  # POST /lessons or /lessons.json
  def create
    # quote_amounts = params[:quote_amounts]
    # logger.info "Quotes amounts is #{quote_amounts}"
    @lesson = Lesson.new(lesson_params)

      @subject_id = params[:lesson][:subject_id]
      @user_id = params[:lesson][:user_id] 

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lessons_path(subject_id:  @subject_id, user_id: @user_id), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
      @subject_id = params[:lesson][:subject_id]
      @user_id = params[:lesson][:user_id] 
     logger.info "subb #{@subject_id}"
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lessons_path(subject_id:  @subject_id,user_id: @user_id), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_path, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:title, :objectives, :class_id, :duration, :procedures, :user_id, :status, :review, :skills,:assesments,:remarks,:weekday,:lesson_date,:activities, :attendance_status,:subject_id,:avafile)
    end
end
