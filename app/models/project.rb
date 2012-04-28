
class Project < ActiveRecord::Base
  validate :address, :present => true, :length => {minimum: 5, maximum: 255}
  
  attr_accessible :address, :amount, :description, :latitude, :longitude, :title, :user, :category, :valid_until
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  belongs_to :user
  belongs_to :category
end
