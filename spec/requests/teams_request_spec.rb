require 'spec_helper'

describe "teams requests" do
  it "successfully joins a team" do
    team = Team.create! name: "Foo", password: "bar"

    login_with_oauth

    within "#join" do
      select team.name, from: "team_id"
      fill_in "team_password", with: team.password
      click_on "Join a Team"
    end

    # Something like /teams/3
    current_path.should == team_path(team)

    omniauth_user.team.should == team
  end

  it "fails to join a team when an incorrect password is used" do
    # Use almost same thing as test above, but change to match this
    # use case (i.e. fill in the wrong password, check that current_path is
    # still teams_new)
  end
end

