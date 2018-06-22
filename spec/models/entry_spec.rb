require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '#for_user' do
    let(:user) { create(:user) }
    let(:own_entry) { create(:entry, user_id: user.id) }
    let(:other_users_entry) { create(:entry, user_id: user.id + 1) }
    before do
      own_entry
      other_users_entry
    end
    it 'scopes own entries' do
      Entry.for_user(user).tap do |entry|
        expect(entry).to include(own_entry)
        expect(entry).not_to include(other_users_entry)
      end
    end
  end
end
