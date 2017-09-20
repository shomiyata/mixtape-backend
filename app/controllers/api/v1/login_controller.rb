class Api::V1::LoginController < ApplicationController

  def create
    query_params={
      client_id: '',
      response_type: 'code',
      redirect_uri: '',
      scope: "playlist-read-private playlist-read-collaborative"
    }

    redirect_to `https://accounts.spotify.com/authorize/?#{query_params.to_query}`
  end
end
