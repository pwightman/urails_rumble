class Pledge < ActiveRecord::Base
  attr_accessible :email

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :length => 3...400
end
