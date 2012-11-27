require 'spec_helper'

describe "Sign in and team creation" do
  it "signs in to github" do
    login_with_oauth
    User.find_by_uid("12345").should_not be_nil
    page.has_content?("Sign out").should == true
  end

  it "redirects away from teams/new if not logged in" do
    visit "/teams/new"

    current_path.should == root_path
  end

  it "allows logged in users to visit teams/new" do
    login_with_oauth
    visit "/teams/new"
    current_path.should == new_team_path
  end
end
