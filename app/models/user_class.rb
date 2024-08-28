class UserClass < ApplicationRecord
    belongs_to :user
    belongs_to :class_field, class_name: 'ClassField' ,foreign_key: "class_id"

end 
