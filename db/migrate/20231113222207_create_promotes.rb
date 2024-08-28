class CreatePromotes < ActiveRecord::Migration[5.2]
  def change
    create_table :promotes do |t|
      t.integer :student_id
      t.integer :from_class_id
      t.integer :to_class_id

      t.timestamps
    end
  end
end
