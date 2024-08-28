class AddAmountToSetupFees < ActiveRecord::Migration[5.2]
  def change
    add_column :setup_fees, :amount, :integer
  end
end
