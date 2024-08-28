class Assessment < ApplicationRecord
    belongs_to :a_user, class_name: 'User', foreign_key: "user_id"
    belongs_to :assessment_master, class_name: 'AssessmentMaster', foreign_key: "assessment_master_id"
    belongs_to :student, class_name: 'Student', foreign_key: "student_id"
    belongs_to :subject_master, class_name: 'SubjectMaster' , foreign_key: "subject_master_id"

 
end
