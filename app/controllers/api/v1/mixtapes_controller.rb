class Api::V1::MixtapesController < ApplicationController

  def index
    @user = User.find(params[:id])
    past_mixtapes = @user.mixtapes
    puts @user.mixtapes
    render json: past_mixtapes, status: 200
  end

  def new
    @user = User.find(params[:id])
    header = { Authorization: "Bearer #{@user.access_token}" }
    query_params = { limit: 50 }
    url = 'https://api.spotify.com/v1/me/playlists' + '?' + query_params.to_query
    user_response = RestClient.get(url, header)
    user_playlists = JSON.parse(user_response.body)
    render json: user_playlists, status: 200
  end

end
