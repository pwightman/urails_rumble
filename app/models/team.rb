class Team < ActiveRecord::Base
  has_many :users
  attr_accessible :name, :password
  
  validates :name, :uniqueness => true
  validates :name, :password, :presence => true
end
