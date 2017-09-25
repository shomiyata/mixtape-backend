class AddUrlColumnWithCorrectType < ActiveRecord::Migration[5.1]
  def change
    add_column :mixtapes, :url, :integer
  end
end
