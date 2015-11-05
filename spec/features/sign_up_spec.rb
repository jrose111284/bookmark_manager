require 'spec_helper'

feature 'User sign up with matching password' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Welcome, me@me.com')
    expect(User.first.email).to eq('me@me.com')
  end

  scenario 'User signup with non matching password' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end
end
