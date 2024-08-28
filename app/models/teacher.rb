class Teacher < ApplicationRecord
    has_many :classes, class_name: 'Class' ,foreign_key: "class_id"
    belongs_to :subject_master, class_name: 'SubjectMaster' , foreign_key: "subject_master_id"
end
