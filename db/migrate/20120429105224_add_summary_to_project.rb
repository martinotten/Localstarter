class AddSummaryToProject < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.text :summary
    end
  end
end
