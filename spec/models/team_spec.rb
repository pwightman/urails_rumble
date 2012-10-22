require 'spec_helper'

describe Team do
  let(:team) { Team.new }

  #before :each do
    #@team = Team.new
  #end

  describe "validation" do
    it "is not valid when name is nil" do
      team.valid?.should == false
    end

    it "is valid when name is non-nil" do
      team.name = "Foobar"
      team.valid?.should == true
    end
  end

end

