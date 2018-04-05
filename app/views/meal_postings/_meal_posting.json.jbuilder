json.extract! meal_posting, :id, :base_time, :end_time, :title, :description, :allergy_notice, :servings, :cost, :created_at, :updated_at
json.url meal_posting_url(meal_posting, format: :json)
