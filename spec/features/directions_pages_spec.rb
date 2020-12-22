require 'rails_helper'

describe "visiting the directions page" do
  it 'sends users to the directions page' do
    visit root_path
    click_link 'Directions'
    expect(page).to have_content "Oh no! You've been stranded!"
  end

  it 'sends users to the directions page' do
    visit root_path
    click_link 'Click here for game rules'
    expect(page).to have_content "Oh no! You've been stranded!"
  end
end