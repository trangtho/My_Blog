require 'rails_helper'

# RSpec.describe CommentsController, type: :controller do
#   login_user
#   let!(:post) {FactoryBot.create :post}
#   let!(:comment) { FactoryBot.create :comment }

#   describe 'GET #index' do
#     # let!(:category) { FactoryBot.create :category }
#     before { get :index }
#     it 'returns http success' do
#       expect(response).to have_http_status(:success)
#     end
#     it 'populates an array of categories' do
#       all_comments = Comment.all
#       expect(assigns(:comment)).to eq(all_comments)
#     end
#     it 'renders the index template' do
#       expect(response).to render_template(:index)
#     end
#   end
# end
RSpec.describe CommentsController, type: :controller do
    login_user
  
    let!(:post) { FactoryBot.create(:post) }
    let!(:comment) { FactoryBot.create(:comment, post: post) }
  
    describe 'GET #index' do
      before { get :index, params: { post_id: post.id } }
  
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
  
      it 'populates an array of comments for the specified post' do
        expect(assigns(:comments)).to eq([comment])
      end
  
      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end
  