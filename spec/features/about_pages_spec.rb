require 'rails_helper'

describe "visiting the about page" do
  it 'registers a new user' do
    visit root_path
    click_link 'About'
    expect(page).to have_content "Ahoy! is a collaborative, outline-intervention game that exposes writers to readers' reactions before writing a first draft."
  end
end