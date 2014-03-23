class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :post_to_report

      t.timestamps
    end
  end
end
