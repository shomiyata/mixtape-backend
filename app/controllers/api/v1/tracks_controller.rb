class Api::V1::TracksController < ApplicationController
  before_action :authorized, only: [:index, :create]

  def index
    mixtape = Mixtape.find_by(spotify_playlist_id: params[:id])
    tracks = mixtape.tracks
    render json: tracks, status: 200
  end

  def search
    header = { Authorization: "Bearer #{current_user.access_token}" }
    query_params = { q: params[:search_query] }
    type_query_params = 'type=track'
    api_url = 'https://api.spotify.com/v1/search' + '?' + query_params.to_query + '&' + type_query_params
    response = RestClient.get(api_url, header)
    tracks = JSON.parse(response.body)

    render json: tracks, status: 200
  end

  def recommend
    header = { Authorization: "Bearer #{current_user.access_token}" }
    api_url = 'https://api.spotify.com/v1/recommendations' + '?seed_tracks=' + params[:seed_tracks]
    response = RestClient.get(api_url, header)
    tracks = JSON.parse(response.body)

    render json: tracks, status: 200
  end

end


#https://api.spotify.com/v1/search?q=killer+queen&type=track
