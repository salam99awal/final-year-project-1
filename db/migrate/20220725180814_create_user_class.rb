class CreateUserClass < ActiveRecord::Migration[5.2]
  def change
    create_table :user_classes do |t|
      t.integer :user_id
      t.integer :class_id
    end
  end
end
