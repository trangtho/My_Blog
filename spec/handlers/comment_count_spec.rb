require 'rails_helper'

RSpec.describe CommentCount do
  describe '#call' do
    let(:post) { create(:post) }
    let(:user) { create(:user) }

    context 'when CommentCreated event is received' do
      it 'increases comment count for post and user' do
        event = double('Event', event_type: 'CommentCreated', data: { post_id: post.id, userpost_id: user.id })

        expect {
          described_class.new.call(event)
        }.to change { post.reload.comment_num }.by(1)
         .and change { user.reload.comment_num }.by(1)
      end
    end

    context 'when CommentDestroyed event is received' do
      it 'decreases comment count for post and user' do
        event = double('Event', event_type: 'CommentDestroyed', data: { post_id: post.id, userpost_id: user.id })

        expect {
          described_class.new.call(event)
        }.to change { post.reload.comment_num }.by(-1)
         .and change { user.reload.comment_num }.by(-1)
      end
    end
  end
end