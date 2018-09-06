json.extract! user, :id, :title, :email, :role, :phone, :first_name, :last_name, :created_at, :updated_at
json.url user_url(user, format: :json)
