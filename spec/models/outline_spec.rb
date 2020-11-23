require 'rails_helper'

describe Outline do
  it { should belong_to(:user) }
  it { should have_many(:boards).through(:board_outlines) }

  it { should validate_presence_of :name }

  it { should validate_presence_of :claim_1 }
  it { should validate_presence_of :evidence_1a }
  it { should validate_presence_of :evidence_1b }
  it { should validate_presence_of :close_call_1 }
  it { should validate_presence_of :red_herring_1 }

  it { should validate_presence_of :claim_2 }
  it { should validate_presence_of :evidence_2a }
  it { should validate_presence_of :evidence_2b }
  it { should validate_presence_of :close_call_2 }
  it { should validate_presence_of :red_herring_2 }
end