class MealPostingsController < ApplicationController
  before_action :set_meal_posting, only: [:show, :edit, :update, :destroy]

  # GET /meal_postings
  # GET /meal_postings.json
  def index
    @meal_postings = MealPosting.all
    if params[:category]
      @meal_postings = MealPosting.where("category_id = #{params[:id].to_i}")
    end
    @categories = Category.all
  end

  # GET /meal_postings/1
  # GET /meal_postings/1.json
  def show
    @user = User.find(@meal_posting.user_id)
  end

  def category
    redirect_to meal_postings_path(id: params[:id], category: true)
  end

  # GET /meal_postings/new
  def new
    @meal_posting = MealPosting.new
  end

  # GET /meal_postings/1/edit
  def edit
  end

  # POST /meal_postings
  # POST /meal_postings.json
  def create
    @meal_posting = MealPosting.new(meal_posting_params)

    respond_to do |format|
      if @meal_posting.save
        format.html { redirect_to @meal_posting, notice: 'Meal posting was successfully created.' }
        format.json { render :show, status: :created, location: @meal_posting }
      else
        format.html { render :new }
        format.json { render json: @meal_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_postings/1
  # PATCH/PUT /meal_postings/1.json
  def update
    respond_to do |format|
      if @meal_posting.update(meal_posting_params)
        format.html { redirect_to @meal_posting, notice: 'Meal posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_posting }
      else
        format.html { render :edit }
        format.json { render json: @meal_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_postings/1
  # DELETE /meal_postings/1.json
  def destroy
    @meal_posting.destroy
    respond_to do |format|
      format.html { redirect_to meal_postings_url, notice: 'Meal posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_posting
      @meal_posting = MealPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def meal_posting_params
    #   params.require(:meal_posting).permit(
    #     :base_time,
    #     :end_time,
    #     :title,
    #     :description,
    #     :allergy_notice,
    #     :servings,
    #     :cost
    #   )
    # end
end
