class AddEndExamsToReportForms < ActiveRecord::Migration[5.2]

  def change

    add_column :report_forms, :end_exams, :datetime

  end

end