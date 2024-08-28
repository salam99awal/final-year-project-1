class AddReopeningToReportForms < ActiveRecord::Migration[5.2]

  def change

    add_column :report_forms, :reopening, :datetime

  end

end