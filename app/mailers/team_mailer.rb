class TeamMailer < ActionMailer::Base
  default from: "urails@urails-rumble.herokuapp.com"
  
  def send_invite(email, sender)
      @greeting = "Hi"
      @email = email
      @sender = sender

      mail to: @email, subject: "Urails Rumble"
  end
end
