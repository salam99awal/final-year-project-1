class CreateAssessmentMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :assessment_masters do |t|
      t.string :name

      t.timestamps
    end
  end
end
