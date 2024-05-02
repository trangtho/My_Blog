require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  login_user

  describe 'GET #index' do
    let!(:category) { FactoryBot.create :category }
    before { get :index }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'populates an array of categories' do
      all_categories = Category.all
      expect(assigns(:category)).to eq(all_categories)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let!(:valid_attributes) { attributes_for(:category) }
      before { post :create, params: { category: valid_attributes, format: :js } }
      it 'creates a new category' do
        expect(Category.count).to eq(1)
      end
      it 'assigns the newly created store to @store' do
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to eq(Category.last)
      end
      it 'reloads this page' do
        expect(response.body).to eq 'location.reload();'
      end
    end

    context "with invalid attributes" do
      let!(:invalid_attributes) { attributes_for(:category, name: nil) }
      it "re-renders the new method" do
        expect(Category.count).to eq(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:z) { FactoryBot.create :category }
    before { delete :destroy, params: { id: z.id } }
    it 'deletes the category' do
      expect(Category.count).to eq(0)
    end
    it 'redirects to categories#index' do
      expect(response).to redirect_to category_path
    end
  end
end
