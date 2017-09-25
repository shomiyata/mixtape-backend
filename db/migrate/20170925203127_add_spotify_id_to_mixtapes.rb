class AddSpotifyIdToMixtapes < ActiveRecord::Migration[5.1]
  def change
    add_column :mixtapes, :sender_spotify_username, :string
  end
end
