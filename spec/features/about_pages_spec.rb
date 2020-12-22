require 'rails_helper'

describe "visiting the about page" do
  it 'sends users to the about page' do
    visit root_path
    click_link 'About'
    expect(page).to have_content "Ahoy! is a collaborative, outline-intervention game that exposes writers to readers' reactions before writing a first draft."
  end

  it 'sends users to the about page' do
    visit root_path
    click_link 'Learn more about the theory behind the game design!'
    expect(page).to have_content "Ahoy! is a collaborative, outline-intervention game that exposes writers to readers' reactions before writing a first draft."
  end
end
