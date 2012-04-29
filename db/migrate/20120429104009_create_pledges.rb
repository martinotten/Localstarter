class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :project_id
      t.decimal :amount, :precision => 16, :scale => 2
      t.string :description
      t.integer :limit

      t.timestamps
    end
  end
end
