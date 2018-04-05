json.extract! user, :id, :user_status, :address, :name, :email, :password_digest, :phone_number, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
