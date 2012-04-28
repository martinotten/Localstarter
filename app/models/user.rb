class User < ActiveRecord::Base
  attr_accessible :email, :name
  # TODO not needed if we use Facebook for login
  validates :name, :presence => true, :uniqueness => true, :length => {minimum: 3, maximum: 25}
end
