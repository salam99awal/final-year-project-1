json.extract! assessment, :id, :assessment_master_id, :marks, :student_id, :teacher_id, :subject_id, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)
