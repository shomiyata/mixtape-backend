class UserMailer < ApplicationMailer

  def new_mixtape(mixtape)
    @mixtape = mixtape
    @url = 'localhost:3000/'
    mail(to: @mixtape.recipient_email, subject: "Woohoo! You've received a new mixtape from #{@mixtape.sender_name}")
  end
end
