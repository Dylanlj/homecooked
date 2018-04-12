class UserMailer < ApplicationMailer
  default from: 'no-reply@homeCooked.com'

  def new_order_email(meal_buyer, meal_owner, meal, reservation_details)
    # @user = user
    # @url  = 'http://example.com/login'
    mail(to: meal_owner.email, subject: 'New meal order!')
  end
end
