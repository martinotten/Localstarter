class Pledge < ActiveRecord::Base
  validate :description, :present => true, :length => { :min => 10, :max => 250 }
  attr_accessible :amount, :description, :limit, :project
  belongs_to :project

  def backers
    backers = []
    self.backs.each do |back|
      if not backers.index(back.user)
        backers.push(back.user)
      end
    end
    return backers
  end

  def backs
    backs = []
    self.project.backs.each do |back|
      if back.amount >= self.amount
        backs.push(back)
      end
    end
    return backs
  end

  def sold_out?
    return backers.length >= self.limit
  end
end
