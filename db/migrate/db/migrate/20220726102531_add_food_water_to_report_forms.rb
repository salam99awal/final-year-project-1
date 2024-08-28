class AddFoodWaterToReportForms < ActiveRecord::Migration[5.2]

  def change

    add_column :report_forms, :food_water, :integer

  end

end