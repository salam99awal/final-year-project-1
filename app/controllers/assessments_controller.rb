class AssessmentsController < ApplicationController
  before_action :set_assessment, only: %i[ show edit update destroy ]

  # GET /assessments or /assessments.json
  def index
    @student_id = params[:id]
    logger.info "this is#{@student_id}"
    @student = Student.where(id: @student_id)
    @student.each do |stu|
    @first_name = stu.first_name
    @last_name = stu.last_name
    end
    @subject_id = params[:subject_master_id]
    logger.info "subject id is #{@subject_id}"

    @assessments = Assessment.where(student_id: @student_id)
    @term = @assessments.first.term if @assessments.present?

    @assess = Assessment.find_by(student_id:@student_id)
    

    logger.info "ass is #{@assess.inspect}"
    if @assess.nil?
    else
    @subject_master_id = @assess.subject_master_id
    end
    logger.info "subject is #{@subject_master_id}"
    #assessment master id 1 is class work 
    #assessment master id 2 is Home work 
    #assessment master id 3 is test  
    #assessment master id 4 is  exam 
    @total_data =[]
    @myassessments =Assessment.joins("INNER JOIN subject_masters ON subject_masters.id = assessments.subject_master_id")
    .select("subject_masters.name,subject_masters.id ").group("name,subject_masters.id").where(student_id:@student_id,is_old:0)
    logger.info "assessments are #{@assessments.inspect}"

    @assessments =Assessment.joins("INNER JOIN subject_masters ON subject_masters.id = assessments.subject_master_id")
    .select("subject_masters.name,subject_masters.id,assessments.term,is_old,grade_status ").group("name,subject_masters.id,term,is_old,grade_status").where(student_id:@student_id,is_old:0)
    logger.info "assessments are #{@assessments.inspect}"
    @assessments.each do |ass|
    @assessment_master_id = ass.id
    logger.info "assessment master id is #{@assessment_master_id}"
    
    @class_work_marks = [] 
    @classwork_assessment = Assessment.where(student_id:@student_id,assessment_master_id:6,subject_master_id:@assessment_master_id,is_old:0)
    logger.info "finding assessment is #{@classwork_assessment.inspect}"
    if @classwork_assessment.empty?
      @class_asses = 0
      @class_work_marks.push(@class_asses)
      logger.info "classwork assessment is in if #{@class_asses}"
    else
    @classwork_assessment.each do |ass|
    @class_work = ass.marks
    logger.info "working is #{@class_work}"

    @class_work_marks.push(@class_work)
    logger.info "class work marks are #{@class_work_marks.inspect}"
    @test_class_asses = @classwork_assessment.sum(:marks).to_f
    if @test_class_asses.nil?
    @class_asses = 0
    logger.info "class work is in if #{@class_asses}"

    else

      @class_asses = @test_class_asses
      logger.info "class work is in else  #{@class_asses}"

    end
    end
  end

    logger.info "class asses is #{@class_asses}"
    @home_work_marks = []
    @home_asses = Assessment.where(student_id:@student_id,assessment_master_id:2,subject_master_id:@assessment_master_id,is_old:0)
    if @home_asses.empty?
      @home = 0
      @home_work_marks.push(@home)
    else
    @home_asses.each do |assed|
    @home_work = assed.marks
    @home= @home_asses.sum(:marks).to_f
    @home_work_marks.push(@home_work)
    end
  end
    @test_results = []
    @test_asses = Assessment.where(student_id:@student_id,assessment_master_id:3,subject_master_id:@assessment_master_id,is_old:0)
    if @test_asses.empty?
      @test = 0
      @test_results.push(@test)
      else
    @test_asses.each do |testing|
    @testing = testing.marks
    @test= @test_asses.sum(:marks).to_f
    @test_results.push(@testing)
    end
  end
  @group = []
    @group_asses = Assessment.where(student_id:@student_id,assessment_master_id:5,subject_master_id:@assessment_master_id,is_old:0)
    if @group_asses.empty?
      @group_work = 0
      @group.push(@group_work)
      else
    @group_asses.each do |testing|
    @grouping = testing.marks
    @group_work= @group_asses.sum(:marks).to_f
    @group.push(@grouping)
    end
  end
    @exam_results = []
    @exam = Assessment.where(student_id:@student_id,assessment_master_id:4,subject_master_id:@assessment_master_id,is_old:0)
    if @exam.empty?
      @exam_asses = 0
      @exam_results.push(@exam_asses)
      else
    @exam.each do |examing|
      @e = examing.marks
    @exam_asses = @exam.sum(:marks).to_f
    @exam_results.push(@e)
  
    end
  end
    
       @totalclass = @class_asses/100*20 + @home + @test + @group_work
   
   logger.info "this is total class: #{@totalclass}"
    
    
     @class_total = @totalclass
      logger.info "this is class total: #{@class_total}"

    logger.info "this exam calculation is #{@exam_calcu}"
    logger.info "this exam asss is #{@exam_asses}"
      @exam_calcu = @exam_asses/100*50
      logger.info "this is exam calcu: #{@exam_calcu}"


     
    
     @total = @class_total + @exam_calcu
      logger.info "this is total: #{@total}"
     @grading = @total
    
    case @grading
    when 80..100
      @grading = "HP"
      @remark =" High Proficiency "

    when 68..79.9
      @grading = "P"
      @remark ="Proficiency"

    when 54..67.9
      @grading = "AP"
      @remark ="Approaching Proficiency"
    when 40..53.9
      @grading = "D"
      @remark ="Developing"
    when 0..39.9
      @grading = "E"
      @remark ="Emerging"
  
    else 
      @grading = 0
      @remark ="not available"
    
     end
     @total_data << [@assessment_master_id,ass.name,@class_work_marks,@home_work_marks,@test_results,@group,@totalclass,@class_total, @exam_calcu,@exam_results,@total,@grading,@remark,ass.term,ass.is_old,ass.grade_status]
     logger.info "this is total data #{@total_data}"    
     @total_data.each do |total|
      @results = total[2]

      logger.info "this is total data with index 2 #{@results}"

      # @results2.sum
     end
  end
  

     respond_to do |format|
      format.html
      format.js
    end

  end

  def view_assesments
    @subject_id = params[:id]
    logger.info "this is#{@subject_id}"
    # @student = Student.where(id: @student_id)
    # @student.each do |stu|
    # @first_name = stu.first_name
    # @last_name = stu.last_name
    # end
    # @subject_id = params[:subject_master_id]
    # logger.info "subject id is #{@subject_id}"
    if @subject_id.present?
      @assessments = Assessment.joins("INNER JOIN students ON students.id = assessments.student_id
        INNER JOIN assessment_masters ON assessment_masters.id = assessments.assessment_master_id")
        .select("first_name, last_name, marks, assessment_master_id, assessment_masters.name as assessment_name, assessments.id as id, students.class_id as class_id")
        .where(subject_master_id: @subject_id)
    else
      @class_id = params[:class_id]
      @assessments = Assessment.joins("INNER JOIN students ON students.id = assessments.student_id
        INNER JOIN assessment_masters ON assessment_masters.id = assessments.assessment_master_id")
        .select("first_name, last_name, marks, assessment_master_id, assessment_masters.name as assessment_name, assessments.id as id, students.class_id as class_id")
        .where(students: { class_id: @class_id })
    end
    

    

    # @assess = Assessment.find_by(student_id:@student_id)
    

  #   if @assess.nil?
  #   else
  #   @subject_master_id = @assess.subject_master_id
  #   end
  #   logger.info "subject is #{@subject_master_id}"
  #   #assessment master id 1 is class work 
  #   #assessment master id 2 is Home work 
  #   #assessment master id 3 is test  
  #   #assessment master id 4 is  exam 
  #   @total_data =[]
  #   @myassessments =Assessment.joins("INNER JOIN subject_masters ON subject_masters.id = assessments.subject_master_id")
  #   .select("subject_masters.name,subject_masters.id ").group("name,subject_masters.id").where(student_id:@student_id,is_old:0)
  #   logger.info "assessments are #{@assessments.inspect}"

  #   @assessments =Assessment.joins("INNER JOIN subject_masters ON subject_masters.id = assessments.subject_master_id")
  #   .select("subject_masters.name,subject_masters.id,assessments.term,is_old ").group("name,subject_masters.id,term,is_old").where(student_id:@student_id,is_old:0)
  #   logger.info "assessments are #{@assessments.inspect}"
  #   @assessments.each do |ass|
  #   @assessment_master_id = ass.id
  #   logger.info "assessment master id is #{@assessment_master_id}"
    
  #   @class_work_marks = [] 
  #   @classwork_assessment = Assessment.where(student_id:@student_id,assessment_master_id:6,subject_master_id:@assessment_master_id,is_old:0)
  #   logger.info "finding assessment is #{@classwork_assessment.inspect}"
  #   if @classwork_assessment.empty?
  #     @class_asses = 0
  #     @class_work_marks.push(@class_asses)
  #     logger.info "classwork assessment is in if #{@class_asses}"
  #   else
  #   @classwork_assessment.each do |ass|
  #   @class_work = ass.marks
  #   logger.info "working is #{@class_work}"

  #   @class_work_marks.push(@class_work)
  #   logger.info "class work marks are #{@class_work_marks.inspect}"
  #   @test_class_asses = @classwork_assessment.sum(:marks).to_f
  #   if @test_class_asses.nil?
  #   @class_asses = 0
  #   logger.info "class work is in if #{@class_asses}"

  #   else

  #     @class_asses = @test_class_asses
  #     logger.info "class work is in else  #{@class_asses}"

  #   end
  #   end
  # end

  #   logger.info "class asses is #{@class_asses}"
  #   @home_work_marks = []
  #   @home_asses = Assessment.where(student_id:@student_id,assessment_master_id:2,subject_master_id:@assessment_master_id,is_old:0)
  #   if @home_asses.empty?
  #     @home = 0
  #     @home_work_marks.push(@home)
  #   else
  #   @home_asses.each do |assed|
  #   @home_work = assed.marks
  #   @home= @home_asses.sum(:marks).to_f
  #   @home_work_marks.push(@home_work)
  #   end
  # end
  #   @test_results = []
  #   @test_asses = Assessment.where(student_id:@student_id,assessment_master_id:3,subject_master_id:@assessment_master_id,is_old:0)
  #   if @test_asses.empty?
  #     @test = 0
  #     @test_results.push(@test)
  #     else
  #   @test_asses.each do |testing|
  #   @testing = testing.marks
  #   @test= @test_asses.sum(:marks).to_f
  #   @test_results.push(@testing)
  #   end
  # end
  # @group = []
  #   @group_asses = Assessment.where(student_id:@student_id,assessment_master_id:5,subject_master_id:@assessment_master_id,is_old:0)
  #   if @group_asses.empty?
  #     @group_work = 0
  #     @group.push(@group_work)
  #     else
  #   @group_asses.each do |testing|
  #   @grouping = testing.marks
  #   @group_work= @group_asses.sum(:marks).to_f
  #   @group.push(@grouping)
  #   end
  # end
  #   @exam_results = []
  #   @exam = Assessment.where(student_id:@student_id,assessment_master_id:4,subject_master_id:@assessment_master_id,is_old:0)
  #   if @exam.empty?
  #     @exam_asses = 0
  #     @exam_results.push(@exam_asses)
  #     else
  #   @exam.each do |examing|
  #     @e = examing.marks
  #   @exam_asses = @exam.sum(:marks).to_f
  #   @exam_results.push(@e)
  
  #   end
  # end
    
  #      @totalclass = @class_asses/100*20 + @home + @test + @group_work
   
  #  logger.info "this is total class: #{@totalclass}"
    
    
  #    @class_total = @totalclass
  #     logger.info "this is class total: #{@class_total}"

  #   logger.info "this exam calculation is #{@exam_calcu}"
  #   logger.info "this exam asss is #{@exam_asses}"
  #     @exam_calcu = @exam_asses/100*50
  #     logger.info "this is exam calcu: #{@exam_calcu}"


     
    
  #    @total = @class_total + @exam_calcu
  #     logger.info "this is total: #{@total}"
  #    @grading = @total
    
  #   case @grading
  #   when 80..100
  #     @grading = "HP"
  #     @remark =" High Proficiency "

  #   when 68..79.9
  #     @grading = "P"
  #     @remark ="Proficiency"

  #   when 54..67.9
  #     @grading = "AP"
  #     @remark ="Approaching Proficiency"
  #   when 40..53.9
  #     @grading = "D"
  #     @remark ="Developing"
  #   when 0..39.9
  #     @grading = "E"
  #     @remark ="Emerging"
  
  #   else 
  #     @grading = 0
  #     @remark ="not available"
    
  #    end
  #    @total_data << [@assessment_master_id,ass.name,@class_work_marks,@home_work_marks,@test_results,@group,@totalclass,@class_total, @exam_calcu,@exam_results,@total,@grading,@remark,ass.term,ass.is_old ]
  #    logger.info "this is total data #{@total_data}"    
  #    @total_data.each do |total|
  #     @results = total[2]

  #     logger.info "this is total data with index 2 #{@results}"

  #     # @results2.sum
  #    end
  # end
  

     respond_to do |format|
      format.html
      format.js
    end

  end

  def edit_assess
    @id = params[:id]
    @class_id = params[:class_id]
    logger.info "student class #{@class_id.inspect}"
    logger.info "this is id for edit #{@id.inspect}"
    @editassessment = Assessment.joins("INNER JOIN students ON students.id = assessments.student_id
    INNER JOIN assessment_masters ON assessment_masters.id = assessments.assessment_master_id")
    .select("first_name, last_name, marks, assessment_master_id, assessment_masters.name as assessment_name, assessments.id as id, 
    students.class_id as class_id").find_by(id:@id)
    @marks = @editassessment.marks
    @first_name =@editassessment.first_name
    @last_name =@editassessment.last_name
    @assessment_masters_name = @editassessment.assessment_name

   


  end

  def update_assessment
    @editassessment = Assessment.find_by(id: params[:assessment][:id])
    

    if @editassessment.update(marks:params[:assessment][:marks])
      redirect_to view_assesments_path(class_id: params[:class_id]), notice: "Assessment updated successfully!"
    else
      render :edit_assess
    end
  end
  
  def students_list

    if current_user.role_id == 1
    @classes = ClassField.all
    else
      # @classes = ClassField.all #Will delete later

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

  # GET /assessments/1 or /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
  @class_id = params[:class_id]
  @id = params[:id]
  @subjects = SubjectMaster.find_by(id:@id)

  @subject_name = @subjects.name
  @subject_master_id = @subjects.id
  @students = Student.where(class_id:@class_id) # Find the student by ID
  



  # Call the retrieve method to fetch assessments
  retrieve

  # logger.info "this is student#{@student.inspect}"
  # @subject_id = params[:subject_master_id]

  @assessment = Assessment.new
  @assessment_masters = AssessmentMaster.all

  respond_to do |format|
    format.html
    format.js
  end
end

def custom_update
  assessment = Assessment.find(params[:id])
  assessment.update(is_old: true)

  redirect_back(fallback_location: "/", notice: 'Assessment updated successfully.')
end

def update_all_is_old
  # Assuming params[:student_id] is provided, replace it with the correct parameter name if needed
  student_id = params[:student_id]

  # Find all assessments for the specified student
  assessments = Assessment.where(student_id: student_id)

  # Update each assessment to set is_old to true
  assessments.update_all(is_old: true)

  redirect_back(fallback_location: "/", notice: 'Assessments updated successfully.')
end


  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments or /assessments.json
  def create

    assessment_master_id = params[:assessment][:assessment_master_id]
    student_id = params[:assessment][:student_id]
    teacher_id = params[:assessment][:user_id]
    subject_id = params[:assessment][:subject_master_id]
    totalmarks = params[:assessment][:marks]
    term = params[:assessment][:term]

    logger.info "teacher #{teacher_id}"
    logger.info "Total marks: #{totalmarks}"
    totalmarks.each do |mark|
      
    puts mark
    @student = Student.find_by(id:student_id)
    @class_id = @student.class_id
    if @class_id == 6||@class_id == 5||@class_id == 7 && assessment_master_id == "4"
      puts 'running if '
      @assessment1 = Assessment.new(assessment_master_id: 6, marks:100, student_id: student_id,user_id:teacher_id,subject_master_id: subject_id,)
      @assessment2 = Assessment.new(assessment_master_id: 2, marks:10, student_id: student_id,user_id:teacher_id,subject_master_id: subject_id)
      @assessment3 = Assessment.new(assessment_master_id: 3, marks:10, student_id: student_id,user_id:teacher_id,subject_master_id: subject_id)
      @assessment4 = Assessment.new(assessment_master_id: 5, marks:10, student_id: student_id,user_id:teacher_id,subject_master_id: subject_id)
      @assessment = Assessment.new(assessment_master_id: assessment_master_id, marks:mark, student_id: student_id,user_id:teacher_id,subject_master_id: subject_id)
      @assessment1.save
      @assessment2.save
      @assessment3.save
      @assessment4.save
      @assessment.save

    else
      puts 'running else'
    @assessment = Assessment.new(assessment_master_id: assessment_master_id, marks:mark, student_id: student_id,user_id:teacher_id,subject_master_id: subject_id)
    @assessment.save
    end
    
    end

    respond_to do |format|
      if @assessment.save
        # format.html { redirect_to root_path, notice: "Assessment was successfully created." }
        format.html { redirect_to assessments_path(id:student_id,subject_master_id:subject_id), notice: "Assessment was successfully created." }

         
        format.json { render :show, status: :created, location: @assessment }
     else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
     end
    end
  end
   # app/controllers/assessments_controller.rb


  # Define a new action to handle the AJAX form submission
  def create_ajax
    teacher_id = params[:user_id]
    subject_id = params[:subject_id]
    term = params[:term]
  
    marks_params = params[:marks]
    logger.info "Subject ID: #{subject_id}"
  
    marks_params.reject! { |_, data| data['student_id'].blank? || data['name'].blank? }
  
    marks_params.each do |_, data|
      student_id = data['student_id'].to_i
      test1 = data['test1'].to_i
      group_work = data['group_work'].to_i
      test_2 = data['test_2'].to_i
      project = data['project'].to_i
      exam = data['exam']
  
      logger.info "student_id ID: #{student_id}"
  
      next if test1.zero? && group_work.zero? && test_2.zero? && project.zero? && exam.blank?
  
      assessment_params = {
        student_id: student_id,
        user_id: teacher_id,
        subject_master_id: subject_id,
        is_old: 0,
        term: term
      }
  
      success = true
  
      if test1.present?
        assessment_params[:assessment_master_id] = 6
        assessment_params[:marks] = test1
        success &= save_assessment(assessment_params)
      end
  
      if group_work.present?
        assessment_params[:assessment_master_id] = 3
        assessment_params[:marks] = group_work
        success &= save_assessment(assessment_params)
      end
  
      if test_2.present?
        assessment_params[:assessment_master_id] = 5
        assessment_params[:marks] = test_2
        success &= save_assessment(assessment_params)
      end
  
      if project.present?
        assessment_params[:assessment_master_id] = 2
        assessment_params[:marks] = project
        success &= save_assessment(assessment_params)
      end
  
      if exam.present?
        assessment_params[:assessment_master_id] = 4
        assessment_params[:marks] = exam
        success &= save_assessment(assessment_params)
      end
  
      unless success
        redirect_to root_path, alert: "Failed to save one or more assessments!"
        return
      end
    end
  
    redirect_to root_path, notice: "All assessments saved successfully!"
  end
  
  def save_assessment(assessment_params)
    student_id = assessment_params[:student_id]
    subject_id = assessment_params[:subject_master_id]
    assessment_master_id = assessment_params[:assessment_master_id] # Include Assessment_master_id
    
    # Check if an assessment with the same student ID, subject ID, and assessment master ID already exists
    existing_assessment = Assessment.find_by(student_id: student_id, subject_master_id: subject_id, assessment_master_id: assessment_master_id)
    
    if existing_assessment.nil?
      # If no existing assessment found, proceed to save the new assessment
      @assessment = Assessment.new(assessment_params)
      if @assessment.save
        # Assessment saved successfully
        return true # Indicate success
      else
        # Handle validation errors or other issues with saving
        logger.error "Failed to save assessment for student ID: #{student_id}"
        logger.error @assessment.errors.full_messages.join(', ')
        return false # Indicate failure
      end
    else
      # Log a message indicating that the assessment already exists
      logger.info "Assessment for student ID: #{student_id}, subject ID: #{subject_id}, and assessment master ID: #{assessment_master_id} already exists"
      return true # Treat as successful (since the assessment already exists)
    end
  end
  
  
  
  
  
# app/controllers/assessments_controller.rb

def retrieve
  @subject_id = params[:subject].to_i
  @student = Student.find(params[:id])
  @assessments = Assessment.joins("INNER JOIN subject_masters ON subject_masters.id = assessments.subject_master_id
      INNER JOIN assessment_masters on assessment_masters.id = assessments.assessment_master_id")
      .select("subject_masters.name as subject_name, assessment_masters.name as assessment_name, assessments.marks,assessments.id as id,assessments.student_id as student_id")
      .where(student_id: @student.id,is_old:0)

  logger.info "Assessments found: #{@assessments.inspect}"
  
  respond_to do |format|
    format.json { render json: { assessments: @assessments } }
    format.html # Render the HTML view with @assessments included
  end
end



# app/controllers/assessments_controller.rb





  


  def check_grade
    @student_id = params[:student_id]

    @subject_id = params[:subject_master_id]
    logger.info "subject master_id: #{@subject_id}"
    @term = params[:term]
    @is_old = params[:is_old]

    
    #assessmnet_master_id = 1 is classwork
    #assessmnet_master_id = 2 is Homework
    #assessmnet_master_id = 3 is classtest
    #assessmnet_master_id = 4 is exam

    @assessment = Assessment.where(student_id:@student_id,assessment_master_id:6,subject_master_id: @subject_id,is_old:0)
    @class_asses = @assessment.sum(:marks).to_f
    @home_asses = Assessment.where(student_id:@student_id,assessment_master_id:2,subject_master_id:@subject_id,is_old:0)
    @home= @home_asses.sum(:marks).to_f
    @test_asses = Assessment.where(student_id:@student_id,assessment_master_id:3,subject_master_id:@subject_id,is_old:0)
    @test= @test_asses.sum(:marks).to_f
    @group = Assessment.where(student_id:@student_id,assessment_master_id:5,subject_master_id:@subject_id,is_old:0)
    @group_work= @group.sum(:marks).to_f
    @exam = Assessment.where(student_id:@student_id,assessment_master_id:4,subject_master_id:@subject_id,is_old:0)
    @exam_asses =@exam.sum(:marks).to_f
    @totalclass = @class_asses/100*20 + @home + @test+ @group_work
    @class_total = @totalclass
    @exam_calcu = @exam_asses/100*50
    @total = @class_total + @exam_calcu

    @grading = @total
    case @grading
    when 80..100
      @grading = "HP"
      @remark =" High Proficiency "

    when 68..79.9
      @grading = "P"
      @remark ="Proficiency"

    when 54..67.9
      @grading = "AP"
      @remark ="Approaching Proficiency"
    when 40..53.9
      @grading = "D"
      @remark ="Developing"
    when 0..39.9
      @grading = "E"
      @remark ="Emerging"
  
    end
   
logger.info "Gradign to be saved #{@grading}"
logger.info "Remark  to be saved #{@remark}"

    @grade = Grade.new(class_results:@class_total,exam_results:@exam_calcu,student_id:@student_id,subject_master_id:@subject_id,total_resullts:@total, grading: @grading, remark: @remark,term:@term,is_old:@is_old)
      @grade.save
      @assessments = Assessment.where(student_id: @student_id, subject_master_id: @subject_id)
      @assessments.each do |assessment|
      assessment.update(grade_status: 1)
      end
     redirect_to assessments_path(id: @student_id)
  end

  # PATCH/PUT /assessments/1 or /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        # format.html { redirect_to assessment_url(@assessment), notice: "Assessment was successfully updated." }
         format.html { redirect_to grades_path(id:@student_id), notice: "Assessment was successfully updated." }

        
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

def delete_assessment
  @student_id = params[:id]
  logger.info "student id #{@student_id}"
  @subject_id = params[:subject_master_id]
  logger.info "subject id #{@subject_id}"
  @assessments =Assessment.where(student_id:@student_id, subject_master_id: @subject_id).delete_all

  # @assessments.destroy(student_id:@student_id,subject_master_id:params[:subject_master_id])
  respond_to do |format|
    format.html { redirect_to assessments_url, notice: "Assessment was successfully destroyed." }
    format.json { head :no_content }
  end
end 

def custom_delete
    @assessment = Assessment.find(params[:id])
      student_id = @assessment.student_id # Get the student ID before deleting


    if @assessment.destroy
      flash[:success] = 'Assessment deleted successfully.'
    else
      flash[:error] = 'Failed to delete assessment.'
    end

  redirect_to new_assessment_path(id: student_id)
end

def destroy
  @assessment = Assessment.find(params[:id])
  if @assessment.destroy
    flash[:success] = "Assessment deleted successfully."
  else
    flash[:error] = "Failed to delete assessment."
  end
  redirect_to :back
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assessment_params
      params.require(:assessment).permit(:assessment_master_id, :marks, :student_id, :user_id, :subject_master_id,:is_old,:term,:test1,:group_work,:test_2,:project,:exam,:grade_status)
    end
end
