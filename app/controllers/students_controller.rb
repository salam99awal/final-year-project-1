class StudentsController < ApplicationController
  require 'csv'

  before_action :set_student, only: %i[ show edit update destroy remark ]

  # GET /students or /students.json
  def index

   

     @student = Student.new

    if getParams = params[:student].present?
    getParams = params[:student][:first_name] 
    logger.info "PARAMS --- #{getParams}"
    @students = Student.joins("INNER JOIN class_fields On class_fields.id = students.class_id").select('students.id,first_name, last_name, name,middle_name,religion,date_of_birth,gender').where("first_name like :getParams OR last_name like :getParams", getParams: "%#{getParams}%" )

    else
       @students = Student.joins("INNER JOIN class_fields On class_fields.id = students.class_id").select('students.id,first_name, last_name, name,middle_name,religion,date_of_birth,gender')
    end

  end


  def promote
    @student = Student.find(params[:id])
    new_class_id = params[:new_class_id]

    # Update the student's class
    @student.update(class_id: new_class_id)

    redirect_back fallback_location: "/", notice: "Student promoted successfully."

  end

  def promote_all
    new_class_id = params[:new_class_id]

    # Update all students in the class
    Student.where(class_id: params[:class_id]).update_all(class_id: new_class_id)

    redirect_back fallback_location: "/", notice: " All Students promoted successfully."
  end

def import_students
    if params[:file].present? && params[:file].content_type == "text/csv"
      file = params[:file]
      begin
        Thread.new do
          CSV.foreach(file.path, headers: true) do |row|
            clinical_doc = Student.new(row.to_hash)
            clinical_doc.save!

          end
        end
        redirect_to students_path, notice: "Patient Medical Records Uploaded"
      rescue StandardError => e
        redirect_to students_path, alert: "Error importing CSV file."
      end
    else
      redirect_to students_path, alert: "Please upload a valid CSV file."
    end
  end



  def student_details
       student_id = params[:id]
        @students = Student.where(id:student_id )

  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @class_fields = ClassField.all

  end

  # GET /students/1/edit
  def edit
     @class_fields = ClassField.all
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_path, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :date_of_birth,:middle_name,:gender,:religion ,:remark, :class_id,:parent_name,:email,:phone_number)
    end
end
