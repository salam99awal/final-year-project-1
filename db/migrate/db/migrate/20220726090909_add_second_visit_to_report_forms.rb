class AddSecondVisitToReportForms < ActiveRecord::Migration[5.2]

  def change

    add_column :report_forms, :second_visit, :datetime

  end

end