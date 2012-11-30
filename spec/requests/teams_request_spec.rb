require 'spec_helper'

describe "teams requests" do
  before :each do
    @team = Team.create!(name: "Foo", password: "Bar")
  end

  after :each do
    @team.destroy
  end

  describe "show action" do
    it " loads if team member views it" do
      @team.users << omniauth_user
      login_with_oauth
      visit team_path(@team)
      current_path.should == team_path(@team)
    end

    it "redirects if not logged in" do
      visit team_path(@team)
      current_path.should == root_path
    end

    it "redirects if member not part of team visits" do
      login_with_oauth
      visit team_path(@team)
      current_path.should == root_path
    end
  end

  describe "new action" do
    it "forwards if user already belongs to team" do
      @team.users << omniauth_user
      login_with_oauth

      visit new_team_path

      current_path.should == team_path(@team)
    end
  end

  describe "User can successfully leave a team" do
    it "Allows users to leave a team" do
      @team.users << omniauth_user
      login_with_oauth
      visit team_path(@team)
      click_on "Leave Team"
      current_path.should == new_team_path
      current_user.team.should == nil
    end
  end

  it "saves bitbucket/heroku/password attributes" do
    @team.users << omniauth_user
    login_with_oauth

    visit team_path(@team)

    new_name = "Elephant"
    new_bitbucket = "my_dog_has_fleas"
    new_heroku = "Harry Potter"

    within ".edit_team" do
      fill_in "team_name", with: new_name
      fill_in "team_bit_bucket", with: new_bitbucket
      fill_in "team_heroku", with: new_heroku
      click_on "Save"
    end

    @team.reload
    @team.name.should == new_name
    @team.heroku.should == new_heroku
    @team.bit_bucket.should == new_bitbucket
  end

  it "successfully joins a team" do
    login_with_oauth

    within "#join" do
      select @team.name, from: "team_id"
      fill_in "team_password", with: @team.password
      click_on "Join a Team"
    end

    # Something like /teams/3
    current_path.should == team_path(@team)

    omniauth_user.team.should == @team
  end

  it "fails to join a team when an incorrect password is used" do
    login_with_oauth

    within "#join" do
      select @team.name, from: "team_id"
      fill_in "team_password", with: "some_wrong_password"
      click_on "Join a Team"
    end

    # Something like /teams/3
    current_path.should == new_team_path

    omniauth_user.team.should be_nil

    page.has_content?("Incorrect password").should == true
  end

  it "fails to join a team when it is full" do
    4.times do |i|
      @team.users << User.create!(uid: i, provider: "github", email: "foodbar_#{i}@foo.com")
    end

    login_with_oauth

    within "#join" do
      select @team.name, from: "team_id"
      fill_in "team_password", with: @team.password
      click_on "Join a Team"
    end

    # Something like /teams/3
    current_path.should == new_team_path

    omniauth_user.team.should be_nil

    page.has_content?("The team you selected is full").should == true
  end
end

