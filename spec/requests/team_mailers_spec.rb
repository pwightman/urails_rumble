require 'spec_helper'

describe "TeamMailers" do
  let(:team) { Factory(:team) }

  it "does not send an email when email field is blank" do
    visit team_path(team)
    click_button "Invite"
    sent_email.should be_empty
  end

  it "sends an email when email field is entered" do
    email = "test@example.com"
    visit team_path(team)
    fill_in "email", with: email
    click_button "Invite"
    sent_email.should include(email)
  end

  it "does not send an invalid email" do
    email = "test@example"
    visit team_path(team)
    fill_in "email", with: email
    click_button "Invite"
    sent_email.should_not include(email)
  end
end
