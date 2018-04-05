require 'test_helper'

class MealRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_rating = meal_ratings(:one)
  end

  test "should get index" do
    get meal_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_rating_url
    assert_response :success
  end

  test "should create meal_rating" do
    assert_difference('MealRating.count') do
      post meal_ratings_url, params: { meal_rating: { comment: @meal_rating.comment, meal_posting_id: @meal_rating.meal_posting_id, rating: @meal_rating.rating, user_id: @meal_rating.user_id } }
    end

    assert_redirected_to meal_rating_url(MealRating.last)
  end

  test "should show meal_rating" do
    get meal_rating_url(@meal_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_rating_url(@meal_rating)
    assert_response :success
  end

  test "should update meal_rating" do
    patch meal_rating_url(@meal_rating), params: { meal_rating: { comment: @meal_rating.comment, meal_posting_id: @meal_rating.meal_posting_id, rating: @meal_rating.rating, user_id: @meal_rating.user_id } }
    assert_redirected_to meal_rating_url(@meal_rating)
  end

  test "should destroy meal_rating" do
    assert_difference('MealRating.count', -1) do
      delete meal_rating_url(@meal_rating)
    end

    assert_redirected_to meal_ratings_url
  end
end
