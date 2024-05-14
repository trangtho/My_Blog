class Api::V1::PostsController < ActionController::API
  include Response
  before_action :set_post, only: %i[show edit update destroy ]

  def index
    @posts = current_user.posts
    render json: @posts.to_json(include: [:user, :categories])
  end

  def show
    render json: @post
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      render json: @post
    else
      render errors: { error: 'Unable to create post.' }, status: 400
    end
    @subcriptions = Subscription.where(subcriber_to_id: current_user.id)
    @subcriptions.each do |subcription|
      UserJob.perform_async(subcription.subcriber.id)
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render errors: { error: 'Unable to update post.' }, status: 400
    end
  end

  def destroy
    if @post.destroy
      render json: @post
    else
      render errors: { error: 'Unable to delete post.' }, status: 400
    end
  end

  def my_post
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(3)
    render json: @posts
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = current_user.posts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:user_id, :title, :content, images: [], category_ids: [])
  end
end
