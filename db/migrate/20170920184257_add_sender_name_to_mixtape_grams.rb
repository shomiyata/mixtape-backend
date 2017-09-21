class AddSenderNameToMixtapeGrams < ActiveRecord::Migration[5.1]
  def change
    add_column :mixtape_grams, :sender_name, :string
  end
end
