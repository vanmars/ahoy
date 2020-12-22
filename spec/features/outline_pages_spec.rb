require 'rails_helper'

describe "the outlines pages path" do
  it 'goes to outlines path' do
    # Sign up and log in
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: 'test_name'
    fill_in 'Email', with: 'test_email@email.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_on 'Sign Up'
    click_link 'Sign Out'
    click_link 'Sign In'
    fill_in 'Email', with: 'test_email@email.com'
    fill_in 'Password', with: 'password'
    click_on 'Log In'
    # Create outline
    click_link 'Outlines'
    expect(page).to have_content('Add an Outline')
  end 
end