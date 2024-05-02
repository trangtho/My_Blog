require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user

  describe 'GET #show' do
    let!(:post) { FactoryBot.create :post }
    before { get :show, params: { id: post.id } }
    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    let!(:post) { FactoryBot.create :post }
    before { get :new }
    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    let!(:post) { FactoryBot.create :post }
    before { get :edit, params: { id: post.id } }
    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let!(:valid_attributes) { attributes_for(:post) }
      before { post :create, params: { post: valid_attributes, format: :html } }
      it 'creates a new category' do
        expect(Post.count).to eq(1)
      end
      it 'assigns the newly created store to @store' do
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to eq(Post.last)
      end
      it 'redirects to notice' do
        expect(flash[:notice]).to match('Post was successfully created.')
      end
    end
    context 'with invalid attributes' do
      let!(:invalid_attributes) { attributes_for(:post, title: nil) }
      it "don't create new post" do
        expect(Post.count).to eq(0)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      let!(:p) { FactoryBot.create :post }
      let!(:valid_attributes) { attributes_for(:post) }
      before { put :update, params: { id: p.id, post: valid_attributes, format: :html } }
      it 'change post attributes' do
        expect(assigns(:post)).to be_a(Post)
      end
      it 'redirects to notice' do
        expect(flash[:notice]).to match('Post was successfully updated.')
      end
    end
 #check it later
    context 'with invalid attributes' do
      let!(:invalid_attributes) { attributes_for(:post, title: 'Weekend', content: nil) }
      it 'redirects to response' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:p) { FactoryBot.create :post }
    before { delete :destroy, params: { id: p.id, format: :html } }
    it 'deletes the category' do
      expect(Post.count).to eq(0)
    end
    it 'redirects to my_post_url' do
      expect(response).to redirect_to my_post_url
    end
  end

  describe 'GET #my_post' do
    let!(:post) { FactoryBot.create :post }
    before { get :my_post }
    it 'redirects to response' do
      expect(response.status).to eq(200)
    end
  end
end
