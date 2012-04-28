class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true, :uniqueness => true, :length => { minimum: 3, maximum: 25 }
  has_many :projects
end
