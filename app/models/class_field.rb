class ClassField < ApplicationRecord 
    has_many :subjects ,foreign_key: "class_id"
    has_many :teachers ,foreign_key: "class_id"
     has_many :students , class_name: 'Students' ,foreign_key: "class_id"
   # belongs_to :a_user, class_name: 'Class', foreign_key: :user_id
    has_many :user_classes
    end
