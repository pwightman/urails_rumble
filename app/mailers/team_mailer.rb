class TeamMailer < ActionMailer::Base
  default from: "urailsrumble@gmail.com"
  
  def send_invite(email, team)
      @greeting = "Hi"
      @email = email
      @team = team

      mail to: @email, subject: "URails Rumble"
  end
end
