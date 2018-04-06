json.extract! reservation, :id, :meal_posting_id, :user_id, :number_of_people, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
