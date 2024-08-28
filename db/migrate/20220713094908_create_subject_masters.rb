class CreateSubjectMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_masters do |t|
      t.string :name

      t.timestamps
    end
  end
end
