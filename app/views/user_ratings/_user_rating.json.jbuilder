json.extract! user_rating, :id, :user_id, :rating, :comment, :created_at, :updated_at
json.url user_rating_url(user_rating, format: :json)
