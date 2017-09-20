class User < ApplicationRecord
  has_many :mixtapes
  has_many :mixtape_grams, through: :mixtapes
end
