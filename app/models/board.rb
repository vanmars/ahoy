class Board < ApplicationRecord
  has_many :board_outlines
  has_many :outlines, through: :board_outlines

  validates :name, presence: true
end