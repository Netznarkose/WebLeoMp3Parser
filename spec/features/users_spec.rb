require 'rails_helper'

describe 'users management' do
  let(:user) { FactoryGirl.create(:user) }

  describe 'authentication' do
    it 'successfull login' do
      login_feature user
      expect(page).to have_content("Logged in!")
    end

    it 'successfull logout' do
      login_feature user
      click_link('Log Out')
      expect(page).to have_content("Logged out!")
    end
  end
end
