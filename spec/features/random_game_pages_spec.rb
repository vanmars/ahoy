require 'rails_helper'

describe "the generate a random game board" do
  it 'generates a random game board' do
    visit root_path
    click_link 'Random'
    fill_in 'Enter a Book Title', with: 'Hobbit'
    click_on 'Play!'
    expect(page).to have_content "Islander's View"
  end

  it 'gives an error when no book found in api' do
    visit root_path
    click_link 'Random'
    fill_in 'Enter a Book Title', with: 'Hamlet'
    click_on 'Play!'
    expect(page).to have_content "Sorry! No record matches your search. Please try another title."
  end

  it 'returns to home screen if "Ahoy" logo clicked' do
    visit root_path
    click_link 'Random'
    click_on 'AHOY!'
    expect(page).to have_content "An outline rescue game."
  end


end