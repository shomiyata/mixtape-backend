class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :spotify_user_id
      t.string :name
      t.string :access_token
      t.string :refresh_token
      t.timestamps
    end
  end
end
