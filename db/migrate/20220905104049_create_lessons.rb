class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :objectives
      t.integer :class
      t.string :duration
      t.text :procedures
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end

  def self.up
    rename_column :lessons, :class, :class_id
  end
  def change
    rename_column :lessons, :class, :class_id
  end
end
