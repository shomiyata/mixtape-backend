class ChangeUrlColumnType < ActiveRecord::Migration[5.1]
  def change
    remove_column :mixtapes, :url
  end
end
