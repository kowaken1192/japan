json.extract! user, :id, :title, :start_date, :end_date, :all_day, :schedule, :created_at, :updated_at
json.url user_url(user, format: :json)
