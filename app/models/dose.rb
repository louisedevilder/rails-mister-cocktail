class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates_uniqueness_of :cocktail, :scope => [:ingredient]
  validates :description, presence: true
  has_attachment :photo
end
