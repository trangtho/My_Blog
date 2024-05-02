require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  login_user
  describe 'GET #index' do
    before { get :index }
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #search' do
    before { get :search }
    it 'renders the search template' do
      expect(response).to render_template(:search)
    end
  end
end
