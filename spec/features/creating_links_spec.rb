require 'spec_helper'
require 'database_cleaner'



feature 'creating links' do

  scenario 'allows you to create a link' do
    visit('/links/new')
    fill_in(:title, with: 'Makers Academy')
    fill_in(:url, with: 'https://www.makersacademy.com')
    click_button('Submit')
    expect(page).to have_content "Makers Academy"
  end
end