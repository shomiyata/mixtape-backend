class Api::V1::MixtapesController < ApplicationController
  before_action :authorized, only: [:index]

  def index
    past_mixtapes = current_user.mixtapes
    puts current_user.mixtapes
    render json: past_mixtapes, status: 200
  end

  def new
    header = { Authorization: "Bearer #{current_user.access_token}" }
    query_params = { limit: 50 }
    api_url = 'https://api.spotify.com/v1/me/playlists' + '?' + query_params.to_query
    user_response = RestClient.get(api_url, header)
    user_playlists = JSON.parse(user_response.body)
    render json: user_playlists, status: 200
  end

  def create
    mixtape = Mixtape.create(name: params[:name], spotify_playlist_id: params[:spotify_playlist_id], user_id: current_user.id)
  end
end
