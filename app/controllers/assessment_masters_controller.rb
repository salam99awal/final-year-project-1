class AssessmentMastersController < ApplicationController
  before_action :set_assessment_master, only: %i[ show edit update destroy ]

  # GET /assessment_masters or /assessment_masters.json
  def index
    @assessment_masters = AssessmentMaster.all
  end

  # GET /assessment_masters/1 or /assessment_masters/1.json
  def show
  end

  # GET /assessment_masters/new
  def new
    @assessment_master = AssessmentMaster.new
  end

  # GET /assessment_masters/1/edit
  def edit
  end

  # POST /assessment_masters or /assessment_masters.json
  def create
    @assessment_master = AssessmentMaster.new(assessment_master_params)

    respond_to do |format|
      if @assessment_master.save
        format.html { redirect_to assessment_masters_path, notice: "Assessment master was successfully created." }
        format.json { render :show, status: :created, location: @assessment_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assessment_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_masters/1 or /assessment_masters/1.json
  def update
    respond_to do |format|
      if @assessment_master.update(assessment_master_params)
        format.html { redirect_to assessment_master_url(@assessment_master), notice: "Assessment master was successfully updated." }
        format.json { render :show, status: :ok, location: @assessment_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assessment_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_masters/1 or /assessment_masters/1.json
  def destroy
    @assessment_master.destroy

    respond_to do |format|
      format.html { redirect_to assessment_masters_url, notice: "Assessment master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_master
      @assessment_master = AssessmentMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assessment_master_params
      params.require(:assessment_master).permit(:name)
    end
end
