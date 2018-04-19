class AnalyticsController < ApplicationController
  def index
    # @categories = Category.all
    @mealpostings = MealPosting.all
    @counter = []
    @categories = ["1", "2", "3", "4", "5"]
    # categories.each do |category_id|
    #   counter.push(@mealpostings.count(:conditions => "category_id = #{category_id}"))
    # end
    # puts "==========HELLO=========="
    @categories.each do |category_id|
      size = MealPosting.where("category_id = #{category_id}").size
      counter.push(size)
    end

    puts "=====HELLO=====#{@counter}"
    @counter
  end
end
