require 'rails_helper'

describe "the adding outlines process" do
  it 'adds an outline' do
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
    click_link 'Add an Outline'
    fill_in 'Name', with: 'test'
    fill_in 'Claim 1', with: 'test'
    fill_in 'Evidence 1a', with: 'test'
    fill_in 'Evidence 1b', with: 'test'
    fill_in 'Close call 1', with: 'test'
    fill_in 'Red herring 1', with: 'test'
    fill_in 'Claim 2', with: 'test'
    fill_in 'Evidence 2a', with: 'test'
    fill_in 'Evidence 2b', with: 'test'
    fill_in 'Close call 2', with: 'test'
    fill_in 'Red herring 2', with: 'test'
    click_on 'Submit'
    expect(page).to have_content "Here are my outlines"
  end 

  it 'returns to main outline page if nav link clicked' do
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
    click_link 'Add an Outline'
    click_on 'Return to outlines'
    expect(page).to have_content "You have no outlines saved."
  end 

  it 'gives an error if form fields not filled in' do
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
    click_link 'Add an Outline'
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end 

end