class DropMixtapeGrams < ActiveRecord::Migration[5.1]
  def change
    drop_table :mixtape_grams
  end
end
