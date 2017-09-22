class Api::V1::UsersController < ApplicationController

  def create
    if params[:error]
      puts "error!!!!", params
      redirect_to "http://localhost:3001"
    else
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: ENV['REDIRECT_URI'],
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET']
      }

      auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
      auth_params = JSON.parse(auth_response.body)

      header = { Authorization: "Bearer #{auth_params["access_token"]}" }
      user_response = RestClient.get('https://api.spotify.com/v1/me', header)
      user_params = JSON.parse(user_response.body)

      @user = User.find_or_create_by(spotify_user_id: user_params["id"])
      @user.update(access_token: auth_params["access_token"], refresh_token: auth_params["refresh_token"])
      @user.refresh_token

      payload = { user_id: @user.id }
      token = issue_token(payload)
      render json: {user: @user, jwt: token}
    end
  end

  def verify
    render json:current_user
  end
end
