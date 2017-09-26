class AddPlaylistPictureToMixtapes < ActiveRecord::Migration[5.1]
  def change
    add_column :mixtapes, :playlist_picture, :string
  end
end
