class Api::V1::TracksController < ApplicationController
  before_action :authorized, only: [:index, :create]

  def index
    mixtape = Mixtape.find_by(spotify_playlist_id: params[:id])
    tracks = mixtape.tracks
    render json: tracks, status: 200
  end
end
