class AddOwnerUsernameToMixtapes < ActiveRecord::Migration[5.1]
  def change
    add_column :mixtapes, :owner_username, :string
  end
end
