class CombineMixtapesAndMixtapeGrams < ActiveRecord::Migration[5.1]
  def change
    add_column :mixtapes, :recipient_email, :string
    add_column :mixtapes, :note, :text
    add_column :mixtapes, :email_required, :boolean
    add_column :mixtapes, :url, :string
    add_column :mixtapes, :sender_name, :string
  end
end
