require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  let(:entry) { FactoryGirl.create(:entry) }
  let(:user) { FactoryGirl.create(:user) }

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
          post :create, entry: FactoryGirl.attributes_for(:entry)
        }.to change(Entry, :count).by(1)
      end
    end
    context 'unhappy path' do
      it 're-directs to index and shows an error-message' do
        expect {
          post :create, entry: FactoryGirl.attributes_for(:entry, term: nil)
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
        delete :destroy, id: entry.id
      }.to change(Entry, :count).by(-1)
    end
  end
end
