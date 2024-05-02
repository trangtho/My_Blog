require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user
  describe 'POST #create' do
    context 'with valid attributes' do
      let!(:p) { FactoryBot.create :post }
      let!(:valid_attributes) { attributes_for(:comment) }
      before { post :create, params: { post_id: p.id, comment: valid_attributes, format: :js } }
      it 'creates a new category' do
        expect(Comment.count).to eq(1)
      end
      it 'assigns the newly created store to @store' do
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to eq(Comment.last)
      end
      it 'reloads this page' do
        expect(response.body).to eq 'location.reload();'
      end
    end

    context 'with invalid attributes' do
      let!(:invalid_attributes) { attributes_for(:comment, content: nil) }
      it "don't create new comment" do
        expect(Comment.count).to eq(0)
      end
    end
  end
  describe 'DELETE #destroy' do
    let!(:co) { FactoryBot.create :comment }
    before { delete :destroy, params: { id: co.id }, format: :js }
    it 'deletes the category' do
      expect(Comment.count).to eq(0)
    end
    it 'reloads this page' do
      expect(response.body).to eq 'location.reload();'
    end
  end
end
