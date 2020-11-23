require 'rails_helper'

describe Board do

  it { should have_many(:outlines).through(:board_outlines) }
  it { should have_many :cards }

  it { should validate_presence_of :name }

end