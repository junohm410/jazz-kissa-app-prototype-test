class DiariesController < ApplicationController
  before_action :set_diary, only: %i[show edit update destroy]

  # GET /diaries or /diaries.json
  def index
    @diaries = Diary.includes(:jazz_cafe)
  end

  # GET /diaries/1 or /diaries/1.json
  def show; end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
    @jazz_cafe_name = @diary.jazz_cafe.name
    @record_title = @diary.record.title
  end

  # POST /diaries or /diaries.json
  def create
    @diary = Diary.new(diary_params)
    @diary.jazz_cafe = JazzCafe.find_or_create_by!(name: params[:diary][:jazz_cafe_name])
    @diary.record = Record.find_or_create_by!(title: params[:diary][:record_title])

    respond_to do |format|
      if @diary.save
        format.html { redirect_to diary_url(@diary), notice: "Diary was successfully created." }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    jazz_cafe = JazzCafe.find_or_create_by!(name: params[:diary][:jazz_cafe_name])
    record = Record.find_or_create_by!(title: params[:diary][:record_title])

    respond_to do |format|
      if @diary.update(diary_params.merge(jazz_cafe_id: jazz_cafe.id, record_id: record.id))
        format.html { redirect_to diary_url(@diary), notice: "Diary was successfully updated." }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy!

    respond_to do |format|
      format.html { redirect_to diaries_url, notice: "Diary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_diary
    @diary = Diary.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def diary_params
    params.require(:diary).permit(:body)
  end
end
