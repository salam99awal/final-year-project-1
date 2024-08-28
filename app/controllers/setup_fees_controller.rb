class SetupFeesController < ApplicationController
  before_action :set_setup_fee, only: %i[ show edit update destroy ]

  # GET /setup_fees or /setup_fees.json
  def index
    @setup_fees = SetupFee.all
  end

  # GET /setup_fees/1 or /setup_fees/1.json
  def show
  end

  # GET /setup_fees/new
  def new
    @setup_fee = SetupFee.new
  end

  # GET /setup_fees/1/edit
  def edit
  end

  # POST /setup_fees or /setup_fees.json
  def create

    @name = params[:setup_fee][:name]
  @amount = params[:setup_fee][:amount]
   @class_id = params[:setup_fee][:class_id]

  if @class_id.nil?
    logger.info "class id nill"
  else
  @class_id.each do |key|
   
  @setup_fee = SetupFee.new(name:@name, amount:@amount,class_id: key)
  @setup_fee.save
  end
end
 


    # @setup_fee = SetupFee.new(setup_fee_params)

    respond_to do |format|
      if @setup_fee.save
        format.html { redirect_to setup_fees_path, notice: "Setup fee was successfully created." }
        format.json { render :show, status: :created, location: @setup_fee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @setup_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setup_fees/1 or /setup_fees/1.json
  def update
    respond_to do |format|
      if @setup_fee.update(setup_fee_params)
        format.html { redirect_to  setup_fees_path, notice: "Setup fee was successfully updated." }
        format.json { render :show, status: :ok, location: @setup_fee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @setup_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setup_fees/1 or /setup_fees/1.json
  def destroy
    @setup_fee.destroy

    respond_to do |format|
      format.html { redirect_to setup_fees_url, notice: "Setup fee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setup_fee
      @setup_fee = SetupFee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setup_fee_params
      params.require(:setup_fee).permit(:name, :class_id,:amount)
    end
end
