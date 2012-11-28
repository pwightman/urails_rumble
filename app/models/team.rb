class Team < ActiveRecord::Base
  has_many :users
  attr_accessible :name, :password, :bit_bucket, :heroku
  
  validates :name, :uniqueness => true
  validates :name, :password, :presence => true
end
