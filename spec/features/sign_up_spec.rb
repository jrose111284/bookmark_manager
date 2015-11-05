feature 'Signing up' do
  scenario 'signing up for a user account' do
    visit('/sign_up')
    fill_in(:email, with: 'maker@maker.com')
    fill_in(:password, with: 'qwerty')
    click_button('Submit')
    #User.create(email: 'maker@maker.com', password: 'qwerty')
    expect(page).to have_content "Welcome"
  end
end