require 'rails_helper'

describe "the generate a game board given two outlines" do
  # it 'generates a random game board' do
  #   visit root_path
  #   click_link 'Play'
  #   fill_in 'Give Your Game a Name', with: 'LotF'
  #   fill_in 'Blue Team Outline ID', with: '3'
  #   fill_in 'Green Team Outline ID', with: '4'
  #   click_on 'Start Game!'
  #   expect(page).to have_content "Islander's View"
  # end

  it 'gives an error when no outline found' do
    visit root_path
    click_link 'Play'
    fill_in 'Give Your Game a Name', with: 'LotF'
    fill_in 'Blue Team Outline ID', with: '3'
    fill_in 'Green Team Outline ID', with: '100'
    click_on 'Start Game!'
    expect(page).to have_content "Couldn't find Outline with 'id'=3"
  end

  it 'returns to home screen if "Ahoy" logo clicked' do
    visit root_path
    click_link 'Play'
    click_on 'AHOY!'
    expect(page).to have_content "An outline rescue game."
  end

end