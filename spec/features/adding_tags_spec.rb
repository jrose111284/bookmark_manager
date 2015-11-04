require 'spec_helper'

feature 'creating links with tags' do

  scenario 'allows you to create a link and add a single tag' do
    visit('/links/new')
    fill_in(:title, with: 'Makers Academy')
    fill_in(:url, with: 'https://www.makersacademy.com')
    fill_in(:name, with: 'cool')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('cool')
  end

  scenario 'allows you to create a link and add multiple tags' do
    visit('/links/new')
    fill_in(:title, with: 'Makers Academy')
    fill_in(:url, with: 'https://www.makersacademy.com')
    fill_in(:name, with: 'this is very cool')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('this')
    expect(link.tags.map(&:name)).to include('is')
    expect(link.tags.map(&:name)).to include('very')
    expect(link.tags.map(&:name)).to include('cool')
  end
end