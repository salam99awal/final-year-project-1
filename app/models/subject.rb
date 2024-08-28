
class Subject < ApplicationRecord
    has_and_belongs_to_many :a_classes, class_name: 'ClassField', foreign_key: "class_id"
    has_many :teachers, class_name: 'Teacher', foreign_key:"subject_id"
    has_many :grades, class_name: 'Grade', foreign_key:"subject_id"
    has_many :assessments, class_name: 'Assessment', foreign_key:"subject_id"
    has_and_belongs_to_many :students, class_name: 'Student', foreign_key: "class_id"
    belongs_to :subject_master ,class_name: 'SubjectMaster', foreign_key: "subject_master_id"
end

