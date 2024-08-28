class MiscUploadsController < ApplicationController
  before_action :set_misc_upload, only: %i[ show edit update destroy ]

  # GET /misc_uploads or /misc_uploads.json
  def index
    
    @misc_uploads = MiscUpload.all
    @patient_id =params[:id]
  end

  # GET /misc_uploads/1 or /misc_uploads/1.json
  def show
  end

  # GET /misc_uploads/new
  def new
    @misc_upload = MiscUpload.new
  end

  # GET /misc_uploads/1/edit
  def edit
  end

  # POST /misc_uploads or /misc_uploads.json
  def create
    @misc_upload = MiscUpload.new(misc_upload_params)

    respond_to do |format|
      if @misc_upload.save
        format.html { redirect_back fallback_location: '/', notice: "Misc upload was successfully created." }
        format.json { render :show, status: :created, location: @misc_upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @misc_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /misc_uploads/1 or /misc_uploads/1.json
  def update
    respond_to do |format|
      if @misc_upload.update(misc_upload_params)
        format.html { redirect_to misc_upload_url(@misc_upload), notice: "Misc upload was successfully updated." }
        format.json { render :show, status: :ok, location: @misc_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @misc_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /misc_uploads/1 or /misc_uploads/1.json
  def destroy
    @misc_upload.destroy

    respond_to do |format|
      format.html { redirect_to misc_uploads_url, notice: "Misc upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_misc_upload
      @misc_upload = MiscUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def misc_upload_params
      params.require(:misc_upload).permit(:user_id, :file, :avafile,:lesson_id )
    end
end
