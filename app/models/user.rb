class User < ApplicationRecord
  has_many :mixtapes
  has_many :mixtape_grams, through: :mixtapes

  def token_expired?
    (Time.now - self.updated_at) > 3480
  end

  def refresh_token
    if token_expired?
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: ENV['REDIRECT_URI'],
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET']
      }

      auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
      auth_params = JSON.parse(auth_response.body)
      self.update(access_token: auth_params["access_token"])
    end
  end
end
