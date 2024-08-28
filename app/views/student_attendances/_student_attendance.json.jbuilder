json.extract! student_attendance, :id, :student_id, :class_id, :present_status, :created_at, :updated_at
json.url student_attendance_url(student_attendance, format: :json)
