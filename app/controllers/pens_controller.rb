class PensController < ApplicationController
  before_action :set_pen, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, excpt: [:index, :show]

  def search
    if params[:search].present?
      @pens = Pen.search(params, fields: [:search])
    else
      @pens = Pen.all
    end
  end

  # GET /pens
  # GET /pens.json
  def index
    @pens = Pen.all
  end

  # GET /pens/1
  # GET /pens/1.json
  def show
    @reviews = Review.where(pen_id: @pen.id).order("created_at DESC")
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  # GET /pens/new
  def new
    @pen = current_user.pens.build
  end

  # GET /pens/1/edit
  def edit
  end

  # POST /pens
  # POST /pens.json
  def create
    @pen = current_user.pens.build(pen_params)

    respond_to do |format|
      if @pen.save
        format.html { redirect_to @pen, notice: 'Pen was successfully created.' }
        format.json { render :show, status: :created, location: @pen }
      else
        format.html { render :new }
        format.json { render json: @pen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pens/1
  # PATCH/PUT /pens/1.json
  def update
    respond_to do |format|
      if @pen.update(pen_params)
        format.html { redirect_to @pen, notice: 'Pen was successfully updated.' }
        format.json { render :show, status: :ok, location: @pen }
      else
        format.html { render :edit }
        format.json { render json: @pen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pens/1
  # DELETE /pens/1.json
  def destroy
    @pen.destroy
    respond_to do |format|
      format.html { redirect_to pens_url, notice: 'Pen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pen
      @pen = Pen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pen_params
      params.require(:pen).permit(:name, :description, :tip_size, :ink_color, :model_no, :image_url, :image, :rating)
    end
end
