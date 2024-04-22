class HomeController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(3)
  end

  def search
    @posts = if params[:term].present?
               Post.where("posts.title ILIKE :value OR
                                                 posts.content ILIKE :value",
                          value: "%#{params[:term]}%")
             else
               Post.all.order(created_at: :DESC)
             end
  end
end
