require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  describe 'GET #show' do
    before { get :show, params: { id: subject.current_user.id } }
    it 'renders status' do
      expect(assigns(:status)).to eq('Following').or eq('Follow')
    end
  end

  describe 'POST #follow' do
    let!(:user) { FactoryBot.create :user }
    before { post :follow, params: { user_id: user.id, format: :js } }
    it 'new subcription' do
      expect(Subscription.count).to eq(1)
    end
    it 'reload' do
      expect(response.body).to eq 'location.reload();'
    end
  end

  describe 'POST #unfollow' do
    let!(:user) { FactoryBot.create :user }
    before { post :follow, params: { user_id: user.id, format: :js } }
    before { post :unfollow, params: { user_id: user.id, format: :js } }
    it 'reload' do
      expect(Subscription.count).to eq(0)
    end
  end
end
