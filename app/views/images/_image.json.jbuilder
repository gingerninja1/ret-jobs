json.extract! image, :id, :name, :picture, :profile_id, :created_at, :updated_at
json.url image_url(image, format: :json)
