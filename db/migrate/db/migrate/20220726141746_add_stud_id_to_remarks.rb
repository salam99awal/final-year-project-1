class AddStudIdToRemarks < ActiveRecord::Migration[5.2]

  def change

    add_column :remarks, :stud_id, :int

  end

end