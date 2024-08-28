class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]

  # GET /subjects or /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1 or /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @class_fields = ClassField.all

  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects or /subjects.json
  def create


  subject_name = params[:subject][:subject_master_id]
  myclass_ids = params[:subject][:class_id]

  puts "class ids #{myclass_ids}"



  myclass_ids.each do |key|
    puts key

    @subject = Subject.new(subject_master_id:subject_name, class_id: key)
    @subject.save

  end


    respond_to do |format|
      if @subject.save
        class_id = params[:class_id]

        # class_id.each do |key|
          
          
          
        format.html { redirect_to subjects_path, notice: "Subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subject_url(@subject), notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name, :subject_master_id,class_id:[])
    end
end
