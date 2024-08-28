class AddMidExamsToReportForms < ActiveRecord::Migration[5.2]

  def change

    add_column :report_forms, :mid_exams, :datetime

  end

end