class CreateBacks < ActiveRecord::Migration
  def change
    create_table :backs do |t|
      t.integer :project_id
      t.integer :user_id
      t.decimal :amount, :precision => 16, :scale => 2

      t.timestamps
    end
  end
end
