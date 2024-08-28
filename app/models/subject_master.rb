class SubjectMaster < ApplicationRecord
    has_many :subjects
    has_many :teachers, class_name: 'Teacher', foreign_key: "subject_master_id"
    has_many :Assessment, class_name: 'Assessment' , foreign_key: "subject_master_id"
    has_many :grades, class_name: 'Grade', foreign_key:"subject_master_id"

end
