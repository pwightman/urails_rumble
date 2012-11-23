require 'spec_helper'

describe TeamsController do
  it "create action" do
    post :create, { 
      :team => { 
        :name => "Foobar", 
        :password => "password" 
      } 
    }

    response.code == 200

    Team.find_by_name("Foobar").should_not be_nil
  end

  it "join action" do
    team = Team.create!(:name => "Foo", :password => "bar")
    get :join, { id: team.id, password: "bar" }

    team.reload
    team.users.include?(user)
  end
end
