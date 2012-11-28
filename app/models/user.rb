class User < ActiveRecord::Base
  belongs_to :team
  attr_accessible :name, :provider, :team_id, :uid, :email
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
    end
  end
end
