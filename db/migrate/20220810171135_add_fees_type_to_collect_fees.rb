class AddFeesTypeToCollectFees < ActiveRecord::Migration[5.2]
  def change
    add_column :collect_fees, :fees_type, :integer
  end
end
