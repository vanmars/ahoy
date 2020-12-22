require 'rails_helper'

describe "visiting the credits page" do
  it 'sends users to the credits page' do
    visit root_path
    click_link 'Credits'
    expect(page).to have_content "Thank You!"
  end
end