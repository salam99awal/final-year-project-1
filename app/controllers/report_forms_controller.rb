class ReportFormsController < ApplicationController

  before_action :set_report_form, only: %i[ show edit update destroy ]


  # GET /report_forms or /report_forms.json

  def index

    @report_forms = ReportForm.all

  end


  # GET /report_forms/1 or /report_forms/1.json

  def show

  end


  # GET /report_forms/new

  def new

    @report_form = ReportForm.new

  end


  # GET /report_forms/1/edit

  def edit

  end


  # POST /report_forms or /report_forms.json

  def create

    @report_form = ReportForm.new(report_form_params)


    respond_to do |format|

      if @report_form.save

        format.html { redirect_to report_forms_path, notice: "Report form was successfully created." }

        format.json { render :show, status: :created, location: @report_form }

      else

        format.html { render :new, status: :unprocessable_entity }

        format.json { render json: @report_form.errors, status: :unprocessable_entity }

      end

    end

  end


  # PATCH/PUT /report_forms/1 or /report_forms/1.json

  def update

    respond_to do |format|

      if @report_form.update(report_form_params)

        format.html { redirect_to report_form_url(@report_form), notice: "Report form was successfully updated." }

        format.json { render :show, status: :ok, location: @report_form }

      else

        format.html { render :edit, status: :unprocessable_entity }

        format.json { render json: @report_form.errors, status: :unprocessable_entity }

      end

    end

  end


  # DELETE /report_forms/1 or /report_forms/1.json

  def destroy

    @report_form.destroy


    respond_to do |format|

      format.html { redirect_to report_forms_url, notice: "Report form was successfully destroyed." }

      format.json { head :no_content }

    end

  end


  private

    # Use callbacks to share common setup or constraints between actions.

    def set_report_form

      @report_form = ReportForm.find(params[:id])

    end


    # Only allow a list of trusted parameters through.

    def report_form_params

      params.require(:report_form).permit(:food_water, :end_exams,:second_visit,:mid_break,:mid_exams,:fist_visit,:reopening,:vacation,:resident_cost_per_day, :resident_no_of_days, :resident_books, :nr_cost_per_day, :nr_no_of_day)

    end

end