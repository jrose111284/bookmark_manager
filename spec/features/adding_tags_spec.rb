require 'spec_helper'

feature 'creating links' do

  scenario 'allows you to create a link' do
    visit('/links/new')
    fill_in(:title, with: 'Makers Academy')
    fill_in(:url, with: 'https://www.makersacademy.com')
    fill_in(:name, with: 'cool')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('cool')
  end
end