class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :class_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
