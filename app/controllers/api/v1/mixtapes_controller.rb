class Api::V1::MixtapesController < ApplicationController
  before_action :authorized, only: [:index, :create]

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
    header = { Authorization: "Bearer #{current_user.access_token}" }

    #Not persisting available markets because there are too many and it would take too long
    # available_markets_api_url = 'https://api.spotify.com/v1/users/' + params[:ownerUsername] + '/playlists/' + params[:spotifyPlaylistId] + '/tracks' + '?fields=items(track(available_markets))'
    # puts available_markets_api_url
    # available_markets_response = RestClient.get(available_markets_api_url, header)
    # available_markets = JSON.parse(available_markets_response.body)
    # puts 'available markets!', available_markets

    tracks_api_url = 'https://api.spotify.com/v1/users/' + params[:ownerUsername] + '/playlists/' + params[:spotifyPlaylistId] + '/tracks' + '?fields=items(track(uri))'
    tracks_response = RestClient.get(tracks_api_url, header)
    playlist_tracks = JSON.parse(tracks_response.body)
    puts 'playlist tracks!', playlist_tracks

    mixtape = Mixtape.create(
      spotify_playlist_id: params[:spotifyPlaylistId],
      sender_spotify_username: current_user.spotify_user_id,
      playlist_name: params[:playlistName],
      name: params[:mixtapeName],
      sender_name: params[:senderName],
      user_id: current_user.id,
      note: params[:mixtapeNote],
      email_required: params[:sendEmail],
      url: Time.now.to_i,
      recipient_email: params[:recipientEmail],
      owner_username: params[:ownerUsername],
      playlist_picture: params[:playlistPicture]
    )

    #extract all playlists from playlists track, iterate over all of them and create.
    #extract available markets, and in the .each for the tracks, iterate through the available markets array and create available market
    #Better to get main markets, and if the region isn't included in the available markets array, to let the user know, instead of persisting all of the available markets

    playlist_tracks["items"].each do |item|
      item["track"].each do |key, val|
        Track.create(track_uri: val, mixtape_id: mixtape.id)
      end
    end
      #Not persisting available markets because there are too many and it would take too long
      # track["track"].each do |k, v|
      #   AvailableMarket.create(region: v, track_id: track.id)
      # end

    render json: mixtape, status: 200
  end

  def build
      header = { Authorization: "Bearer #{current_user.access_token}" }
      api_url = "https://api.spotify.com/v1/users/#{current_user.spotify_user_id}/playlists"
      user_response = RestClient.post(api_url, header)
      new_playlist = JSON.parse(user_response.body)
      puts new_playlist
        # mixtape = Mixtape.find_by(spotify_playlist_id: params[:id])
        # tracks = mixtape.tracks
        #
        # header = {
        #   Authorization: "Bearer #{current_user.access_token}",
        #   content_type: "application/json" }
        #
        # body = {
        #   "uris": tracks
        # }
        # user_response = RestClient.post("https://api.spotify.com/v1/users/#{current_user.spotify_user_id}/playlists/#{params[:id]}/tracks", body.to_json, header.to_json)
        # response = JSON.parse(user_response.body)
        # render json: response, status: 200

  end

  def show
    mixtape = Mixtape.find_by(url: params[:url])
    render json: mixtape, status: 200
  end
end
