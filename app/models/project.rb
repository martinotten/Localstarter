class Project < ActiveRecord::Base
  attr_accessible :address, :amount, :description, :geo_lat, :geo_lng, :title, :user, :valid_until
  belongs_to :user
end
