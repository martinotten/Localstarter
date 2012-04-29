class Back < ActiveRecord::Base
  validate :project, :present => true
  validate :user, :present => true

  attr_accessible :amount, :project, :user

  belongs_to :project
  belongs_to :user
end
