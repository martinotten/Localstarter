class Project < ActiveRecord::Base
  validate :address, presence: true, length: {minimum: 5, maximum: 255}
  validate :description, presence: true, length: {minimum: 200, maximum: 10_000}
  validate :summary, presence: true, length: {minimum: 20, maximum: 200}
  validate :title, presence: true, length: {minimum: 20, maximum: 150} 
  
  attr_accessible :address, :amount, :description, :latitude, :longitude, :title, :user, :category, :valid_until
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  belongs_to :user
  belongs_to :category
  has_many :backs
end
