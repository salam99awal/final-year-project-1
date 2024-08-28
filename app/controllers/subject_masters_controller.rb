class SubjectMastersController < ApplicationController
  before_action :set_subject_master, only: %i[ show edit update destroy ]

  # GET /subject_masters or /subject_masters.json
  def index
    @subject_masters = SubjectMaster.all
  end

  # GET /subject_masters/1 or /subject_masters/1.json
  def show
  end

  # GET /subject_masters/new
  def new
    @subject_master = SubjectMaster.new
  end

  # GET /subject_masters/1/edit
  def edit
  end

  # POST /subject_masters or /subject_masters.json
  def create
    @subject_master = SubjectMaster.new(subject_master_params)

    respond_to do |format|
      if @subject_master.save
        format.html { redirect_to subject_masters_path, notice: "Subject master was successfully created." }
        format.json { render :show, status: :created, location: @subject_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_masters/1 or /subject_masters/1.json
  def update
    respond_to do |format|
      if @subject_master.update(subject_master_params)
        format.html { redirect_to subject_master_url(@subject_master), notice: "Subject master was successfully updated." }
        format.json { render :show, status: :ok, location: @subject_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_masters/1 or /subject_masters/1.json
  def destroy
    @subject_master.destroy

    respond_to do |format|
      format.html { redirect_to subject_masters_url, notice: "Subject master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_master
      @subject_master = SubjectMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_master_params
      params.require(:subject_master).permit(:name)
    end
end
