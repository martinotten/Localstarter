class Pledge < ActiveRecord::Base
  validate :description, :present => true, :length => { :min => 10, :max => 250 }
  attr_accessible :amount, :description, :limit, :project
  belongs_to :project

  def backers
    backers = []
    backs.each do |back|
      if not backers.index(back.user)
        backers.push(back.user)
      end
    end
    return backers
  end

  def backs
    backs = []
    project.backs.each do |back|
      if back.amount >= amount
        backs.push(back)
      end
    end
    return backs
  end

  def sold_out?
    return has_backers? && backers.length >= limit
  end

  def has_backers?
    return backers.length > 0
  end
end
