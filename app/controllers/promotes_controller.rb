class PromotesController < ApplicationController
  before_action :set_promote, only: %i[ show edit update destroy ]

  # GET /promotes or /promotes.json
  def index
    @promotes = Promote.all
  end

  # GET /promotes/1 or /promotes/1.json
  def show
  end

  # GET /promotes/new
  def new
    @promote = Promote.new
  end

  # GET /promotes/1/edit
  def edit
  end

  # POST /promotes or /promotes.json
  def create
    @promote = Promote.new(promote_params)

    respond_to do |format|
      if @promote.save
        format.html { redirect_to promote_url(@promote), notice: "Promote was successfully created." }
        format.json { render :show, status: :created, location: @promote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @promote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotes/1 or /promotes/1.json
  def update
    respond_to do |format|
      if @promote.update(promote_params)
        format.html { redirect_to promote_url(@promote), notice: "Promote was successfully updated." }
        format.json { render :show, status: :ok, location: @promote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @promote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotes/1 or /promotes/1.json
  def destroy
    @promote.destroy

    respond_to do |format|
      format.html { redirect_to promotes_url, notice: "Promote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promote
      @promote = Promote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def promote_params
      params.require(:promote).permit(:student_id, :from_class_id, :to_class_id)
    end
end
