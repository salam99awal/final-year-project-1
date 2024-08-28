class Role < ApplicationRecord
    has_many :users, class_name: 'Users', foreign_key: :role_id

end
