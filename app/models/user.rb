class User < ApplicationRecord
     belongs_to :a_role, class_name: 'Role', foreign_key: :role_id
      has_many :user_classes, class_name: 'UserClass', foreign_key: :user_id
     # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
end
