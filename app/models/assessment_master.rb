class AssessmentMaster < ApplicationRecord
    has_many :assessment ,class_name: 'Assessment', foreign_key:"assessment_master_id" 

end
