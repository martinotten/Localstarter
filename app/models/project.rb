class Project < ActiveRecord::Base
  validate :address, presence: true, length: {minimum: 5, maximum: 255}
  validate :description, presence: true, length: {minimum: 200, maximum: 10_000}
  validate :summary, presence: true, length: {minimum: 20, maximum: 200}
  validate :title, presence: true, length: {minimum: 20, maximum: 150} 
  validate :valid_until, presence: true
  
  attr_accessible :address, :amount, :description, :latitude, :longitude, :title, :user, :category, :valid_until
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  belongs_to :user
  belongs_to :category
  has_many :backs
  has_many :pledges

  def backers
    backers = []
    self.backs.each do |back|
      if not backers.index(back.user)
        backers.push(back.user)
      end
    end
    return backers
  end

  def backed_amount
    amount = 0
    self.backs.each do |back|
      amount += back.amount
    end
    return amount
  end

  def backed_percent
    return (self.backed_amount / self.amount) * 100
  end

  def has_pledges?
    return self.pledges.length > 0
  end
end
