class Project < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.rename :geo_lng, :longitude
      t.rename :geo_lat, :latitude
    end
  end
end
