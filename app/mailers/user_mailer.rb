class UserMailer < ApplicationMailer

  def new_mixtape(mixtape)
    @mixtape = mixtape
    @url = 'https://mixtapes-arent-dead.herokuapp.com/'
    mail(to: @mixtape.recipient_email, subject: "Woohoo! You've received a new mixtape from #{@mixtape.sender_name}")
  end
end
