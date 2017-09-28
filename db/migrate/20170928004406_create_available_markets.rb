class CreateAvailableMarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :available_markets do |t|
      t.integer :track_id
      t.string :region
    end
  end
end
