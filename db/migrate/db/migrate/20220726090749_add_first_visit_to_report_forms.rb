class AddFirstVisitToReportForms < ActiveRecord::Migration[5.2]

  def change

    add_column :report_forms, :fist_visit, :datetime

  end

end