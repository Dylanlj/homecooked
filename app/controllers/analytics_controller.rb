class AnalyticsController < ApplicationController
  def index
    # @categories = Category.all
    @mealpostings = MealPosting.all
    # counter = []
    categories = ["1", "2", "3"]
    # categories.each do |category_id|
    #   counter.push(@mealpostings.count(:conditions => "category_id = #{category_id}"))
    # end
    # puts "==========HELLO=========="
    categories.each do |category_id|
      puts category_id
    end


    @selectedmeals = MealPosting.where("category_id = 1").size
    puts "=====HELLO====="
    puts @selectedmeals
  end
end
