class AddTeacherConductToRemarks < ActiveRecord::Migration[5.2]

  def change

    add_column :remarks, :teacher_conduct, :string

  end

end