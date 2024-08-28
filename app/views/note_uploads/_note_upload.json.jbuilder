json.extract! note_upload, :id, :user_id, :lesson_id, :subject_id, :created_at, :updated_at
json.url note_upload_url(note_upload, format: :json)
