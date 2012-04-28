class Project < ActiveRecord::Base
  attr_accessible :address, :amount, :description, :geo_lat, :geo_lng, :title, :user, :category, :valid_until
  belongs_to :user
  belongs_to :category
end
