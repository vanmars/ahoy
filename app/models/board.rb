class Board < ApplicationRecord
  has_many :board_outlines
  has_many :outlines, through: :board_outlines

  validates :name, :outline_id_1, :outline_id_2, presence: true
end