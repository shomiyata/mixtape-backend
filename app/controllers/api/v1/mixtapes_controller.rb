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
    puts 'this is params', params
    mixtape = Mixtape.create(spotify_playlist_id: params[:spotifyPlaylistId], playlist_name: params[:playlistName], name: params[:mixtapeName], sender_name: params[:senderName], user_id: current_user.id)
    render json: mixtape, status: 200
  end
end
