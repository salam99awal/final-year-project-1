class Grade < ApplicationRecord
    belongs_to :student, class_name: 'Student', foreign_key: "student_id"
    belongs_to :subject_master, class_name: 'SubjectMaster', foreign_key: "subject_master_id"

end
