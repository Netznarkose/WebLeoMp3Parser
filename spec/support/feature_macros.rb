require 'rails_helper'

def login_feature(user)
  visit log_in_path
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button('Log in')
end
