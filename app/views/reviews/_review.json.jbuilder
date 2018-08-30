json.extract! review, :id, :rating, :review, :profile_id, :created_at, :updated_at
json.url review_url(review, format: :json)
