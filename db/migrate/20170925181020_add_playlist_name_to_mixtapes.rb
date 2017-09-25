class AddPlaylistNameToMixtapes < ActiveRecord::Migration[5.1]
  def change
    add_column :mixtapes, :playlist_name, :string
  end
end
