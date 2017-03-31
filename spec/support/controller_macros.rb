require 'rails_helper'

def login(user)
  session[:user_id] = user.id
end
