require 'spec_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Welcome, me@me.com')
    expect(User.first.email).to eq('me@me.com')
  end
end

#   scenario 'password confirmation' do
#     visit('/sign_up')
#     fill_in(:email, with: 'maker@maker.com')
#     fill_in(:password, with: 'qwerty')
#     fill_in(:password_confirmation, with: 'q')
#     click_button('Submit')
#     #User.create(email: 'maker@maker.com', password: 'qwerty')
#     expect(page).to have_content "Error"
#   end
# end