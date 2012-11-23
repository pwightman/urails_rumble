require 'spec_helper'

describe TeamsController do
  it "create action" do
    set_auth_headers

    post :create, { 
      :team => { 
        :name => "Foobar", 
        :password => "password" 
      } 
    }

    response.code == 200

    Team.find_by_name("Foobar").should_not be_nil
  end
end
