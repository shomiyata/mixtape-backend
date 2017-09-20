class Mixtape < ApplicationRecord
  belongs_to :user
  has_many :mixtape_grams
end
