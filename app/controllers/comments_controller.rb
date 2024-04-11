class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    rescue
      redirect_to root_path
    @comment = @post.comments.create(user_id: current_user.id, content: comment_params['content'])
  
    if @comment.save
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
    else
      render 'posts/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
