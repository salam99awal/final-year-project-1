class CreateJoinTableClassSubject < ActiveRecord::Migration[5.2]
  def change
    create_join_table :classes, :subjects do |t|
      # t.index [:class_id, :subject_id]
      # t.index [:subject_id, :class_id]
    end
  end
end
