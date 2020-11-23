class Outline < ApplicationRecord
  belongs_to :user

  validates :name, :claim_1, :evidence_1a, :evidence_1b, :close_call_1, :red_herring_1, :claim_2, :evidence_2a, :evidence_2b, :close_call_2, :red_herring_2, presence: true
end