class Outline < ApplicationRecord
  belongs_to :user
  has_many :board_outlines
  has_many :boards, through: :board_outlines

  validates :name, :claim_1, :evidence_1a, :evidence_1b, :close_call_1, :red_herring_1, :claim_2, :evidence_2a, :evidence_2b, :close_call_2, :red_herring_2, presence: true
end