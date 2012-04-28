class User < ActiveRecord::Base
  attr_accessible :email, :name
  # TODO not needed if we use Facebook for login
  validates :name, :presence => true, :uniqueness => true, :length => {minimum: 3, maximum: 25}

  devise :omniauthable #followed by anything else you need

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end
end
