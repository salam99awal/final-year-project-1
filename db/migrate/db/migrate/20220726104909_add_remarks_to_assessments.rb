class AddRemarksToAssessments < ActiveRecord::Migration[5.2]

  def change

    add_column :assessments, :remarks, :string

  end

end