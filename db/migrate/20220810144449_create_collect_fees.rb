class CreateCollectFees < ActiveRecord::Migration[5.2]
  def change
    create_table :collect_fees do |t|
      t.integer :amount_received
      t.integer :student_id
      t.integer :user_id

      t.timestamps
    end
  end
end
