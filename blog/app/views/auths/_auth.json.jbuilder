json.extract! auth, :id, :name, :email, :created_at, :updated_at
json.url auth_url(auth, format: :json)
