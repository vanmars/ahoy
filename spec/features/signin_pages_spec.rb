require 'rails_helper'

describe "the log in an existing user process" do
  it 'registers a new user' do
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
    expect(page).to have_content 'Hi, test_name'
  end

  it 'redirects to sign up page when link clicked' do
    visit root_path
    click_link 'Sign In'
    click_link 'Sign up'
    expect(page).to have_content "Sign Up"
  end
end