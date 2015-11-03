require 'spec_helper'
require 'database_cleaner'



feature 'list of links' do

  scenario 'shows a list of links on the homepage' do
  	Link.create(url: 'https//www.makersacademy.com', title: 'Makers Academy')
  	visit('/links')
  	expect(page.status_code).to eq 200
  	within 'ul#links' do
  		expect(page).to have_content "Makers Academy"
  	end
  end
end