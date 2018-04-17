class MealPostingsController < ApplicationController
  before_action :set_meal_posting, only: [:show, :edit, :update, :destroy]

  # GET /meal_postings
  # GET /meal_postings.json
  def index
    @meal_postings = MealPosting.all
    puts "=====Hello===== #{@meal_postings.class}"
    if params[:category]
      @meal_postings = MealPosting.where("category_id = #{params[:id].to_i}")
    end

    if current_user
      m_lat = current_user.latitude
      m_lng = current_user.longitude
    else
      m_lat = 43.644881
      m_lng = -79.395208
    end

    @meal_postings = @meal_postings.sort  {|a, b|
      a_lat = a.user.latitude
      a_lng = a.user.longitude
      b_lat = b.user.latitude
      b_lng = b.user.longitude
      distance_a = Math.sqrt((m_lat - a_lat) ** 2 + (m_lng - a_lng) ** 2)
      distance_b = Math.sqrt((m_lat - b_lat) ** 2 + (m_lng - b_lng) ** 2)
      distance_a <=> distance_b
    }

    @categories = Category.all
  end

  # GET /meal_postings/1
  # GET /meal_postings/1.json
  def show
    @user = User.find(@meal_posting.user_id)
    @usermeals = @user.meal_postings
    @reservation = Reservation.new
    @other_meal_ids = MealPosting.where("user_id = ? AND id != ?", @meal_posting.user_id, @meal_posting.id).ids
    @ordered_meal_ids = @other_meal_ids.unshift(@meal_posting.id)
  end

  #GET /meal_posting/1/reviews
  def meal_posting_reviews
    @meal_posting = MealPosting.find(params[:id])
    @review = MealRating.new
  end


  def category
    redirect_to meal_postings_path(id: params[:id], category: true)
  end

  # GET /meal_postings/new
  def new
  # or params[:user_id].to_i

    # Stops users with status "User" from accessing meal creation form by typing in URL
    if current_user.user_status == "User"
      redirect_to root_path
    else

      @meal_posting = MealPosting.new
      if current_user  != User.find(params[:user_id])
        if current_user
          redirect_to user_path(current_user.id)
        else
          redirect_to root_path
        end
      end

    end
  end

  # GET /meal_postings/1/edit
  def edit
  end

  # POST /meal_postings
  # POST /meal_postings.json
  def create
    @meal_posting = MealPosting.new(meal_posting_params)
    @meal_posting.user = current_user

puts @meal_posting
puts @meal_posting.date
    respond_to do |format|
      if @meal_posting.save
        format.html { redirect_to @meal_posting }#, notice: 'Meal posting was successfully created.' }
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
        format.html { redirect_to @meal_posting }#, notice: 'Meal posting was successfully updated.' }
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
    redirect_to user_path(current_user.id)
    # respond_to do |format|
      # format.html { redirect_to meal_postings_url } #, notice: 'Meal posting was successfully destroyed.' }
      # format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_posting
      @meal_posting = MealPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_posting_params
      params.require(:meal_posting).permit(
        :base_time,
        :end_time,
        :title,
        :description,
        :allergy_notice,
        :servings,
        :cost,
        :image,
        :category_id,
        :date
      )
    end


end
