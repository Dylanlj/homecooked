class UserMailer < ApplicationMailer
  default from: 'no-reply@homeCooked.com'

  def new_order_email(meal_buyer, meal_owner, meal, reservation_details)
    @meal_buyer = meal_buyer
    @meal_owner = meal_owner
    @meal = meal
    @reservation_details = reservation_details
    # @url  = 'http://example.com/login'
    mail(to: meal_owner.email, subject: 'New meal order!')
  end
end
