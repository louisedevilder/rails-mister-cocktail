class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy
  validates_associated :ingredients
  validates :name, presence: true, uniqueness: true
  has_attachment :photo
end
