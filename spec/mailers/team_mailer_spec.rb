require "spec_helper"

describe TeamMailer do
  describe "send_invite" do
    let(:user) { Factory(:user)}
    let(:mail) { TeamMailer.send_invite("test@example.com", user) }

    it "renders the headers" do
      mail.subject.should eq("Urails Rumble")
      mail.to.should eq(["test@example.com"])
      mail.from.should eq(["urails@urails-rumble.herokuapp.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
