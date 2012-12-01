class TeamMailer < ActionMailer::Base
  default from: "urails@urails-rumble.herokuapp.com"
  
  def send_invite(email, team)
      @greeting = "Hi"
      @email = email
      @team = team

      mail to: @email, subject: "Urails Rumble"
  end
end
