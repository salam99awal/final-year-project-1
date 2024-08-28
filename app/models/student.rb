class Student < ApplicationRecord
    has_many :assessments, class_name: 'Assessment', foreign_key: "student_id"
    has_many :grades , class_name: 'Grade', foreign_key:"student_id"
    has_one :remark ,class_name: 'Remark', foreign_key:"student_id"
    belongs_to :a_class ,class_name: 'ClassField', foreign_key: "class_id"
end
