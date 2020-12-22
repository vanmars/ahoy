require 'rails_helper'

describe "the generate a game board given two outlines" do
  # it 'generates a random game board' do
  #   # Sign up and log in
  #   visit root_path
  #   click_link 'Sign Up'
  #   fill_in 'Name', with: 'test_name'
  #   fill_in 'Email', with: 'test_email@email.com'
  #   fill_in 'Password (6 characters minimum)', with: 'password'
  #   fill_in 'Password Confirmation', with: 'password'
  #   click_on 'Sign Up'
  #   click_link 'Sign Out'
  #   click_link 'Sign In'
  #   fill_in 'Email', with: 'test_email@email.com'
  #   fill_in 'Password', with: 'password'
  #   click_on 'Log In'
  #   # Create outline
  #   click_link 'Outlines'
  #   click_link 'Add an Outline'
  #   fill_in 'Name', with: 'test'
  #   fill_in 'Claim 1', with: 'test'
  #   fill_in 'Evidence 1a', with: 'test'
  #   fill_in 'Evidence 1b', with: 'test'
  #   fill_in 'Close call 1', with: 'test'
  #   fill_in 'Red herring 1', with: 'test'
  #   fill_in 'Claim 2', with: 'test'
  #   fill_in 'Evidence 2a', with: 'test'
  #   fill_in 'Evidence 2b', with: 'test'
  #   fill_in 'Close call 1', with: 'test'
  #   fill_in 'Red herring 1', with: 'test'
  #   click_on 'Submit'
  #   # Create a second outline
  #   click_link 'Add an Outline'
  #   fill_in 'Name', with: 'test'
  #   fill_in 'Claim 1', with: 'test'
  #   fill_in 'Evidence 1a', with: 'test'
  #   fill_in 'Evidence 1b', with: 'test'
  #   fill_in 'Close call 1', with: 'test'
  #   fill_in 'Red herring 1', with: 'test'
  #   fill_in 'Claim 2', with: 'test'
  #   fill_in 'Evidence 2a', with: 'test'
  #   fill_in 'Evidence 2b', with: 'test'
  #   fill_in 'Close call 1', with: 'test'
  #   fill_in 'Red herring 1', with: 'test'
  #   click_on 'Submit'
  #   # Generate game board
  #   click_link 'Play'
  #   fill_in 'Give Your Game a Name', with: 'test'
  #   fill_in 'Blue Team Outline ID', with: '1'
  #   fill_in 'Green Team Outline ID', with: '2'
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