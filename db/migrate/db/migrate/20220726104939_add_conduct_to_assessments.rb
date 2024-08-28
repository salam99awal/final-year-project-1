class AddConductToAssessments < ActiveRecord::Migration[5.2]

  def change

    add_column :assessments, :conduct, :string

  end

end