require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  let(:entry) { create(:entry) }
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    login user
  end

  describe "GET #index" do
    it 'renders index' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context 'happy path' do
      it 'creates a new entry' do
        expect {
          post :create, params: { entry: attributes_for(:entry) }
        }.to change(Entry, :count).by(1)
      end
    end
    context 'unhappy path' do
      it 'does not create an entry when term is empty' do
        expect {
          post :create, params: { entry: attributes_for(:entry, term: nil) }
        }.to change(Entry, :count).by(0)
      end
      it 'does not create an entry when url could not be found' do
        expect {
          post :create, params: { entry: attributes_for(:entry, term: '23409sdlfkj', url: nil) }
        }.to change(Entry, :count).by(0)
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      entry
    end
    it 'deletes an entry' do
      expect {
        delete :destroy, params: { id: entry.id }
      }.to change(Entry, :count).by(-1)
    end
  end
  describe "#remove_all" do
    before do
      3.times { create(:entry, user_id: user.id) }
      2.times { create(:entry, user_id: other_user.id ) }
    end
    it 'deletes all entries of current user' do
      expect {
        get :remove_all
      }.to change(Entry, :count).by(-3)
    end
  end
end
