class Api::V1::PlaylistsController < ApplicationController

  def create
    track_uris = params[:trackUris]

    header = {
      "Authorization" => "Bearer #{current_user.access_token}" ,
      "Content-Type" => "application/json"
    }

    body = {
      name: params[:playlistName]
    }

    api_url = "https://api.spotify.com/v1/users/#{current_user.spotify_user_id}/playlists"
    api_response = RestClient.post(api_url, body.to_json, header)
    new_playlist = JSON.parse(api_response.body)

    track_body = {
      uris: track_uris
    }

    tracks_api_url = "https://api.spotify.com/v1/users/#{current_user.spotify_user_id}/playlists/#{new_playlist["id"]}/tracks"
    tracks_api_response = RestClient.post(tracks_api_url, track_body.to_json, header)
    parsed_tracks_api_response = JSON.parse(tracks_api_response.body)
    render json: parsed_tracks_api_response, status: 200
  end
end
