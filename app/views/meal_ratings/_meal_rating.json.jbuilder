json.extract! meal_rating, :id, :meal_posting_id, :user_id, :comment, :rating, :created_at, :updated_at
json.url meal_rating_url(meal_rating, format: :json)
