class HomeController < ApplicationController
    # def index
    #     # @posts = Post.all
    #     @posts = Post.all.page(params[:page]).per(3)
    # end
    def index
        @posts = Post.order(created_at: :desc).page(params[:page]).per(3)
    end

    def my_page
        @posts = Post.where(user_id: session[:current_user_id]).order(created_at: :desc).page(params[:page]).per(3)
        @current_user = User.find_by id: session[:current_user_id]
    end

end
