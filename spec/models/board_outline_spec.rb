require 'rails_helper'

describe BoardOutline do
  
  it { should belong_to :board }
  it { should belong_to :outline }

end