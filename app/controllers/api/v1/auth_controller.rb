class Api::V1::AuthController < ApplicationController

  def login
    query_params={
      client_id: ENV['CLIENT_ID'],
      response_type: 'code',
      redirect_uri: ENV['REDIRECT_URI'],
      scope: "playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize/"
    redirect_to "#{url}?#{query_params.to_query}"
  end

  def verify
    render json: current_user
  end
end
