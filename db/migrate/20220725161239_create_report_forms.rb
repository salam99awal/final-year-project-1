class CreateReportForms < ActiveRecord::Migration[5.2]

  def change

    create_table :report_forms do |t|

      t.integer :resident_cost_per_day

      t.integer :resident_no_of_days

      t.integer :resident_books

      t.integer :nr_cost_per_day

      t.integer :nr_no_of_day


      t.timestamps

    end

  end

end