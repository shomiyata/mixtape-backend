class CreateMixtapeGrams < ActiveRecord::Migration[5.1]
  def change
    create_table :mixtape_grams do |t|
      t.string :recipient_email
      t.text :note
      t.boolean :email_required
      t.string :url
      t.integer :mixtape_id
      t.timestamps
    end
  end
end
