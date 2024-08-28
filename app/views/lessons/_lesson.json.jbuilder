json.extract! lesson, :id, :title, :objectives, :class, :duration, :procedures, :user_id, :status, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
