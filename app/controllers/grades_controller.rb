class GradesController < ApplicationController
  before_action :set_grade, only: %i[ show edit update destroy ]

  # GET /grades or /grades.json
  def index
   @student_id = params[:id]
   @student = Student.find(params[:id])
   logger.info "student is #{@student.inspect}"
    @assessment = Assessment.where(student_id: @student_id)
    @grades = Grade.where(student_id: @student_id,is_old:0)

  end

  def report
    @student_id = params[:id]
    @student = Student.find(params[:id])
    logger.info "student is #{@student.inspect}"
    @grades = Grade.where(student_id: @student_id,is_old: 0)
    logger.info "grade is is #{@grades.inspect}"


     @assessment_conduct = Assessment.where(student_id: @student_id).last
     @class_id = @student.class_id
     logger.info "-------------#{@class_id}------------------here class id"
    #logger.info"------------- #{@assessment_conduct.inspect}"
    @class_name = ClassField.where(id: @class_id)
    logger.info "====================#{@class_name.inspect}==============pluck name model"
    logger.info "=================classname here----------::#{@class_name.pluck(:name)}"
    @classname = @class_name.pluck(:name).join(',')
    @pdfparams = ReportForm.last

    @remarks_model = Remark.where(stud_id: @student).last
    if @remarks_model.nil?

    else

    @remarks_model = Remark.where(stud_id: @student).last
    logger.info "=================remarks model #{@remarks_model.inspect}"

    @promoted_to = @remarks_model.promoted_to
    @overall_attendance = @remarks_model.overall_attendance
    @student_attendance = @remarks_model.student_attendance
    @teacher_conduct= @remarks_model.teacher_conduct
    @teacher_remark = @remarks_model.teacher_remark
    @teachers_id = @remarks_model.teacher_id
    @teacher_name_model = User.where(id: @teachers_id)
    @teacher_name_me = @teacher_name_model.pluck(:full_name).join(',')
    @class
    @grades = Grade.where(student_id: @student_id,is_old:0)
    @class_count = Student.where(class_id: @class_id).count
    @report_remark = Remark.where(stud_id: @student_id)
    logger.info "this report remark #{@report_remark.inspect}"
    
    @reopening_date = ReportForm.last
    if @reopening_date.nil?
    else
    @date = @reopening_date.reopening.strftime('%Y-%m-%d')
    end
    end
    #
    if @report_remark.present?
    @conduct = @report_remark[0].teacher_conduct
    @remark = @report_remark[0].teacher_remark

    logger.info "===== #{@student_id}"

    logger.info "=====Conduct #{@conduct}"

    logger.info "=====Remark #{@remark}"
    else
 @conduct = "none"
  @remark = "none"
    end

#       if @pdfparams.present?

#     @resident_total = (@pdfparams.resident_cost_per_day * @pdfparams.resident_no_of_days)

#     logger.info "This is the resident total----- #{@resident_total}"

#     @non_resident_total = (@pdfparams.nr_cost_per_day * @pdfparams.nr_no_of_day)

#     logger.info "This is the resident total----- #{@non_resident_total}"

#     else
#  @resident_total = "not available"
#   @non_resident_total = "not available"
#     end

    @student_name = Grade.joins("INNER JOIN students ON students.id = grades.student_id").select("first_name,last_name,middle_name").where(student_id: @student_id)
    logger.info "this is name #{@student_name[0].first_name}"

    respond_to do |format|
      format.html
      format.pdf do
     test = render pdf: "report" ,template:"grades/report.html.erb" ,locals: { grade: @grades, name: @student_name,pdfparams: @pdfparams,conduct:  @conduct,remark: @remark} # Excluding ".pdf" extension.
    #  ReportMailer.with(id: @student_id).send_report.deliver_now
      # mail to: @student.email, subject: "Report"
      end

   end


  end

  def send_email
    @student_id = params[:id]
    logger.info "student is #{@student.inspect}"


    ReportMailer.with(id: @student_id).send_report.deliver_now

    respond_to do |format|
    format.html { redirect_back fallback_location:"/", notice: "Email was successfully sent." }
    end
  end

  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grade_url(@grade), notice: "Grade was successfully created." }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grade_url(@grade), notice: "Grade was successfully updated." }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    @grade = Grade.find(params[:id])
    student_id = params[:student_id]
    @grade.destroy

    respond_to do |format|
      format.html{redirect_to grades_path(id: student_id), notice: 'Grade was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:class_results, :exam_results, :student_id, :total_resullts, :subject_master_id,:term)
    end
end
