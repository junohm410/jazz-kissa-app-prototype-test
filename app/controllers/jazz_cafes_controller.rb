class JazzCafesController < ApplicationController
  before_action :set_jazz_cafe, only: %i[show edit update destroy]

  # GET /jazz_cafes or /jazz_cafes.json
  def index
    @jazz_cafes = JazzCafe.all
  end

  # GET /jazz_cafes/1 or /jazz_cafes/1.json
  def show; end

  # GET /jazz_cafes/new
  def new
    @jazz_cafe = JazzCafe.new
  end

  # GET /jazz_cafes/1/edit
  def edit; end

  # POST /jazz_cafes or /jazz_cafes.json
  def create
    @jazz_cafe = JazzCafe.new(jazz_cafe_params)

    respond_to do |format|
      if @jazz_cafe.save
        format.html { redirect_to jazz_cafe_url(@jazz_cafe), notice: "Jazz cafe was successfully created." }
        format.json { render :show, status: :created, location: @jazz_cafe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jazz_cafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jazz_cafes/1 or /jazz_cafes/1.json
  def update
    respond_to do |format|
      if @jazz_cafe.update(jazz_cafe_params)
        format.html { redirect_to jazz_cafe_url(@jazz_cafe), notice: "Jazz cafe was successfully updated." }
        format.json { render :show, status: :ok, location: @jazz_cafe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jazz_cafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jazz_cafes/1 or /jazz_cafes/1.json
  def destroy
    @jazz_cafe.destroy!

    respond_to do |format|
      format.html { redirect_to jazz_cafes_url, notice: "Jazz cafe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jazz_cafe
    @jazz_cafe = JazzCafe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def jazz_cafe_params
    params.require(:jazz_cafe).permit(:name)
  end
end
