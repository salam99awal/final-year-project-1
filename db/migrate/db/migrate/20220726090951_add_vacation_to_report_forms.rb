class AddVacationToReportForms < ActiveRecord::Migration[5.2]

  def change

    add_column :report_forms, :vacation, :datetime

  end

end