require 'rails_helper'

describe "the sign up a new user process" do
  it 'registers a new user' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: 'test_name'
    fill_in 'Email', with: 'test_email@email.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content 'Hi, test_name'
  end

  it 'gives an error when no name, email, or password is entered' do
    visit root_path
    click_link 'Sign Up'
    click_on 'Sign Up'
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
  end
end