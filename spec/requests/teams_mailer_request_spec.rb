require 'spec_helper'

describe "TeamMailers" do
  let(:team) { Factory(:team) }

  before :each do
    team.users << omniauth_user
    login_with_oauth
  end

  it "does not send an email when email field is blank" do
    visit team_path(team)
    click_button "Send Invite"
    sent_email.should be_empty
    page.should have_content("The email address you entered is not valid")
  end

  it "sends an email when email field is entered" do
    email = "test@example.com"
    visit team_path(team)
    fill_in "email", with: email
    click_button "Send Invite"
    sent_email.should_not be_empty
    page.should have_content("Invite has been sent")
  end

  it "does not send an invalid email" do
    email = "test@example"
    visit team_path(team)
    fill_in "email", with: email
    click_button "Send Invite"
    sent_email.should_not include(email)
    page.should have_content("The email address you entered is not valid")
  end
end
