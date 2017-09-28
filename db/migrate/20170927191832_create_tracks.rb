class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :track_uri
      t.integer :mixtape_id
    end
  end
end
