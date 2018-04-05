require 'test_helper'

class MealPostingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_posting = meal_postings(:one)
  end

  test "should get index" do
    get meal_postings_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_posting_url
    assert_response :success
  end

  test "should create meal_posting" do
    assert_difference('MealPosting.count') do
      post meal_postings_url, params: { meal_posting: { allergy_notice: @meal_posting.allergy_notice, base_time: @meal_posting.base_time, cost: @meal_posting.cost, description: @meal_posting.description, end_time: @meal_posting.end_time, servings: @meal_posting.servings, title: @meal_posting.title } }
    end

    assert_redirected_to meal_posting_url(MealPosting.last)
  end

  test "should show meal_posting" do
    get meal_posting_url(@meal_posting)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_posting_url(@meal_posting)
    assert_response :success
  end

  test "should update meal_posting" do
    patch meal_posting_url(@meal_posting), params: { meal_posting: { allergy_notice: @meal_posting.allergy_notice, base_time: @meal_posting.base_time, cost: @meal_posting.cost, description: @meal_posting.description, end_time: @meal_posting.end_time, servings: @meal_posting.servings, title: @meal_posting.title } }
    assert_redirected_to meal_posting_url(@meal_posting)
  end

  test "should destroy meal_posting" do
    assert_difference('MealPosting.count', -1) do
      delete meal_posting_url(@meal_posting)
    end

    assert_redirected_to meal_postings_url
  end
end
