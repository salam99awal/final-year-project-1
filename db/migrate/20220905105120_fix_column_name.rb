class FixColumnName < ActiveRecord::Migration[5.2]
   def self.up
    rename_column :lessons, :class, :class_id
  end
  def change
    rename_column :lessons, :class, :class_id
  end
end
