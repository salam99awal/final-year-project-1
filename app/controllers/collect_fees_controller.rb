class CollectFeesController < ApplicationController
  before_action :set_collect_fee, only: %i[ show edit update destroy ]
  require 'resolv-replace'

  # PRIVATE_KEY = '2023042811002253'
  # PUBLIC_KEY = '4532da8fbe679c10'
  # URL='https://api.msmpusher.net'
  # SENDER_ID = "ShalomSch"
  # REQHDR = {'Content-Type' => 'Application/json', 'timeout' => '180'}
  # CONN = Faraday.new(:url=>URL,:headers=>REQHDR) do |f|
  #   f.response :logger
  #   f.adapter Faraday.default_adapter
  # end

  # GET /collect_fees or /collect_fees.json
  def index
    @collect_fees = CollectFee.all
  end

  def main
    @classes = ClassField.all
    @collect_fee = CollectFee.new


  end
def fees_payment
    @class_id = params[:id]
    logger.info "this is a class_id id #{@class_id}"
    @collect_fee = CollectFee.new

    respond_to do |format|
      format.js
  end
end 

# def sendmsg(recipient, txtmsg)

#    url_endpoint = '/v1/send'

#   # begin
#   api_params = {
#       "privatekey": PRIVATE_KEY,
#       "publickey": PUBLIC_KEY,
#       "sender": SENDER_ID,
#       "numbers": recipient,
#       "message": txtmsg
#   }
#   api_params = api_params.to_json

#     res = CONN.post do |req|
#       req.url url_endpoint
#       req.options.timeout = 30           # open/read timeout in seconds
#       req.options.open_timeout = 30      # connection open timeout in second
#       req.body = api_params
#     end
#   puts
#   logger.info "Result from TEST: #{res.body}"
#   _st_body = res.body

# end

def view_fees
  @student_id = params[:id]

  logger.info "STUDNE IDD #{@student_id}"
  @collect_fees = CollectFee.joins("INNER JOIN setup_fees ON setup_fees.id = collect_fees.fees_type
  INNER JOIN students ON students.id = collect_fees.student_id
  ").select(
    "collect_fees.student_id, collect_fees.fees_type,setup_fees.name,sum(collect_fees.amount_received) as amount_received,setup_fees.amount,
    first_name, last_name,setup_fees.class_id,collect_fees.created_at").where(student_id: @student_id)
    .group(:fees_type,:amount_received,:first_name,:last_name,:amount,:student_id,:class_id,:created_at,:name).where(student_id: @student_id)
logger.info "this is a collect fees #{@collect_fees.inspect}" 
@collect = @collect_fees.group_by(&:fees_type)
@total_collection = []
@collect.each do |key, value|
  logger.info "this is a key #{key}"
  logger.info "this is a value #{value}"
  @find_setup_fee = SetupFee.where(id: key)
  @find_setup_fee.each do |fee|
    logger.info "this is a fee #{fee.inspect}"
    @total_amount = fee.amount
    @name = fee.name
    @total_amount_received = value.sum(&:amount_received)
    @total_amount_due = @total_amount - @total_amount_received
    logger.info "this is a total amount #{@total_amount}"
    logger.info "this is a total amount received #{@total_amount_received}"
    logger.info "this is a total amount due #{@total_amount_due}"
  end
  @total_collection << [@name,@total_amount,@total_amount_received,@total_amount_due]
  logger.info "this is a total collection #{@total_collection.inspect}"
  # @value_received = 0
  # value.each do |v |
  #   value_received += v.amount_received
  #   logger.info "this is a v #{value_received}"
  # end
  # logger.info "this is a v2 #{value_received}"
end

logger.info "this is a collect fees #{@collect.inspect}"

end

def find_fees
  @fee_find = 0
  @student_id = params[:student_id]
  logger.info "this is a student id #{@student_id}"
  @student_info = Student.find(@student_id)
  @class_id = @student_info.class_id
  logger.info "this is a class id #{@class_id}"
  @fee_type = params[:fee_type]
  logger.info "this is a fee type #{@fee_type}"
  # @collect_fee = CollectFee.new
  @setup_fee = SetupFee.where(id:@fee_type,class_id: @student_id)
  logger.info "this is a setup fee #{@setup_fee.inspect}"
  @setup_fee.each do |fee|
    @fee_amount = fee.amount
  end
  if @fee_amount.nil?
    @fee_amount = 2
  else
    @fee_find = 1
  end
  logger.info "this is find fee in the if statement showing fees exit  #{@fee_find}"
  logger.info "this is a amount #{@fee_amount}"
  respond_to do |format|
    format.js
  end
 
end

  def fees
    @student_id = params[:id]
    @collect_fee = CollectFee.new
    @class_id = params[:id]
    logger.info "this is a class id #{@class_id}"
    @students = Student.where(:class_id => @class_id)
    @collect_fees = CollectFee.joins("INNER JOIN setup_fees ON setup_fees.id = collect_fees.fees_type
  INNER JOIN students ON students.id = collect_fees.student_id
  ").select(
    "collect_fees.student_id, collect_fees.fees_type,setup_fees.name,sum(collect_fees.amount_received) as amount_received,setup_fees.amount,first_name, last_name").where(student_id: @student_id).group("collect_fees.fees_type")
    .group(:fees_type,:amount_received,:first_name,:last_name,:amount,:student_id).where(student_id: @student_id)
    @collect = @collect_fees.group_by(&:fees_type)
@total_collection = []
    @collect.each do |key, value|
  logger.info "this is a key #{key}"
  logger.info "this is a value #{value}"
  @find_setup_fee = SetupFee.where(id: key)
  @find_setup_fee.each do |fee|
    logger.info "this is a fee #{fee.inspect}"
    @total_amount = fee.amount
    @total_amount_received = value.sum(&:amount_received)
    @total_amount_due = @total_amount - @total_amount_received
    logger.info "this is a total amount #{@total_amount}"
    logger.info "this is a total amount received #{@total_amount_received}"
    logger.info "this is a total amount due #{@total_amount_due}"
  end
  @total_collection << [@name,@total_amount,@total_amount_received,@total_amount_due]

end
  end 
  # GET /collect_fees/1 or /collect_fees/1.json
  def show
  end

  # GET /collect_fees/new
  def new
    @collect_fee = CollectFee.new
  end

  # GET /collect_fees/1/edit
  def edit
  end

  # POST /collect_fees or /collect_fees.json
  def create
    @collect_fee = CollectFee.new(collect_fee_params)

    @student = Student.find(params[:collect_fee][:student_id])
    @amount_received = params[:collect_fee][:amount_received]

     logger.info  "@student #{@student.inspect}"
    logger.info  "@amount_received #{@amount_received}"
     logger.info  "@phone_number #{@student.phone_number}"

    @find_setup_fee = SetupFee.where(class_id: @student.class_id)
    @class_fees = @find_setup_fee[0].amount

      logger.info  "@class_fees #{@class_fees}"

    @arears = @class_fees.to_f - @amount_received.to_f
    
       logger.info  "@arears #{@arears}"

       
        

    respond_to do |format|
      if @collect_fee.save

            if @student.phone_number.present?

         txtmsg = "An amount of GHC #{@amount_received} was received from #{@student.first_name} #{@student.last_name} as part payment of 3rd Term fees with a balance of GHC #{@arears}."
         sendmsg(@student.phone_number, txtmsg)
        else
          logger.info "No SMS SENT"
        end

        format.html { redirect_to fees_path(:id=> @student.class_id) , notice: "fee was successfully entered." }
        format.json { render :show, status: :created, location: @collect_fee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collect_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collect_fees/1 or /collect_fees/1.json
  def update
    respond_to do |format|
      if @collect_fee.update(collect_fee_params)
        format.html { redirect_to collect_fee_url(@collect_fee), notice: "Collect fee was successfully updated." }
        format.json { render :show, status: :ok, location: @collect_fee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collect_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collect_fees/1 or /collect_fees/1.json
  def destroy
    @collect_fee.destroy

    respond_to do |format|
      format.html { redirect_to collect_fees_url, notice: "Collect fee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collect_fee
      @collect_fee = CollectFee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collect_fee_params
      params.require(:collect_fee).permit(:amount_received, :student_id, :user_id,:fees_type)
    end
end
