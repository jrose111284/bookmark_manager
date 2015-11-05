require 'spec_helper'

def sign_up
  visit('/sign_up')
  fill_in(:email, with: 'me@me.com')
  fill_in(:password, with: '12345')
  click_button 'Submit'
end