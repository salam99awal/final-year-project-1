class AddIsOldToAssessment < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :is_old, :boolean
  end
end
