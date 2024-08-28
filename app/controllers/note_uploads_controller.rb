class NoteUploadsController < ApplicationController
  before_action :set_note_upload, only: %i[ show edit update destroy ]

  # GET /note_uploads or /note_uploads.json
  def index
    @note_uploads = NoteUpload.all
  end

  # GET /note_uploads/1 or /note_uploads/1.json
  def show
  end

  # GET /note_uploads/new
  def new
    @note_upload = NoteUpload.new
  end

  # GET /note_uploads/1/edit
  def edit
  end

  # POST /note_uploads or /note_uploads.json
  def create
    @note_upload = NoteUpload.new(note_upload_params)


      @subject_id = params[:note_upload][:subject_id]
      @user_id = params[:note_upload][:user_id] 

    respond_to do |format|
      if @note_upload.save
        format.html { redirect_to lessons_path(subject_id:  @subject_id, user_id: @user_id), notice: "Note upload was successfully created." }
        format.json { render :show, status: :created, location: @note_upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_uploads/1 or /note_uploads/1.json
  def update
    respond_to do |format|
      if @note_upload.update(note_upload_params)
        format.html { redirect_to note_uploads_path, notice: "Note upload was successfully updated." }
        format.json { render :show, status: :ok, location: @note_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_uploads/1 or /note_uploads/1.json
  def destroy
    @note_upload.destroy

    respond_to do |format|
      format.html { redirect_to note_uploads_url, notice: "Note upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_upload
      @note_upload = NoteUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_upload_params
      params.require(:note_upload).permit(:user_id, :lesson_id, :subject_id,:avafile)
    end
end
