class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :address
      t.decimal :geo_lng, :precision => 16, :scale => 13
      t.decimal :geo_lat, :precision => 16, :scale => 13
      t.decimal :amount, :precision => 16, :scale => 2
      t.datetime :valid_until

      t.timestamps
    end
  end
end
