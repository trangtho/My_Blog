class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(user_id: current_user.id, content: comment_params['content'])

    if @comment.save
      #config for event
      stream_name = "commentcreate#{@comment.id}"
      event_data = { post_id: params[:post_id], user_id: current_user.id, content: comment_params['content'], userpost_id: @post.user_id }
      event = ::CommentCreated.new(data: event_data)
      Rails.configuration.event_store.publish(event, stream_name: stream_name, expected_version: 1)
      respond_to do |format|
        format.js { render inline: 'location.reload();' }
      end
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #config for event
    @post = Post.find(params[:post_id])
    stream_name = "commentdestroy#{params[:id]}"
    event_data = { post_id: params[:post_id], user_id: current_user.id, userpost_id: params[:userpost_id] }
    event = ::CommentDestroyed.new(data: event_data)
    Rails.configuration.event_store.publish(event, stream_name: stream_name, expected_version: 1)

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
