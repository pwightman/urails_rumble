require 'spec_helper'

=begin
describe "Pledge views" do
  it "renders pledges at the home page" do
    visit "/"

    page.has_content?("URails Rumble!").should == true
  end

  it "shows error when blank email address is entered" do
    visit "/"

    # fill_in "pledge_email", with: ""

    click_button "GO FIGHT WIN"

    page.has_content?("Email can't be blank").should == true
  end

  it "shows error when invalid email is entered" do
    visit "/"

    fill_in "pledge_email", with: "foo@foo"

    click_button "GO FIGHT WIN"

    page.has_content?("Email is invalid").should == true
  end

  it "shows error when invalid email is entered" do
    visit "/"

    fill_in "pledge_email", with: "foofoo"

    click_button "GO FIGHT WIN"

    page.has_content?("Email is invalid").should == true
  end

  it "succeeds when valid email is entered" do
    visit "/"

    fill_in "pledge_email", with: "foo@foo.com"

    click_button "GO FIGHT WIN"

    page.has_content?("Thanks! We'll keep you posted.").should == true

    Pledge.where(email: "foo@foo.com").first.should_not == nil
  end
end
=end
