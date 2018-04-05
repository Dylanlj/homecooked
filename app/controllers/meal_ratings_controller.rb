class MealRatingsController < ApplicationController
  before_action :set_meal_rating, only: [:show, :edit, :update, :destroy]

  # GET /meal_ratings
  # GET /meal_ratings.json
  def index
    @meal_ratings = MealRating.all
  end

  # GET /meal_ratings/new
  def new
    @meal_rating = MealRating.new
  end


  # POST /meal_ratings
  # POST /meal_ratings.json
  def create
    @meal_rating = MealRating.new(meal_rating_params)

    respond_to do |format|
      if @meal_rating.save
        format.html { redirect_to @meal_rating, notice: 'Meal rating was successfully created.' }
        format.json { render :show, status: :created, location: @meal_rating }
      else
        format.html { render :new }
        format.json { render json: @meal_rating.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /meal_ratings/1
  # DELETE /meal_ratings/1.json
  def destroy
    @meal_rating.destroy
    respond_to do |format|
      format.html { redirect_to meal_ratings_url, notice: 'Meal rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_rating
      @meal_rating = MealRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_rating_params
      params.require(:meal_rating).permit(:meal_posting_id, :user_id, :comment, :rating)
    end
end
