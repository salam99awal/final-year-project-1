class ClassFieldsController < ApplicationController
  before_action :set_class_field, only: %i[ show edit update destroy ]
  

  # GET /class_fields or /class_fields.json
  def index
    @class_fields = ClassField.all
  end

  # GET /class_fields/1 or /class_fields/1.json
  def show
  end

  # GET /class_fields/new
  def new
    @class_field = ClassField.new
  end

  # GET /class_fields/1/edit
  def edit
  end

  # POST /class_fields or /class_fields.json
  def create
    @class_field = ClassField.new(class_field_params)

    respond_to do |format|
      if @class_field.save
        format.html { redirect_to class_fields_path, notice: "Class field was successfully created." }
        format.json { render :show, status: :created, location: @class_field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_fields/1 or /class_fields/1.json
  def update
    respond_to do |format|
      if @class_field.update(class_field_params)
        format.html { redirect_to class_field_url(@class_field), notice: "Class field was successfully updated." }
        format.json { render :show, status: :ok, location: @class_field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_fields/1 or /class_fields/1.json
  def destroy
    @class_field.destroy

    respond_to do |format|
      format.html { redirect_to class_fields_url, notice: "Class field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_field
      @class_field = ClassField.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_field_params
      params.require(:class_field).permit(:name)
    end
end
