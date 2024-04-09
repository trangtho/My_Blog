class HomeController < ApplicationController
    def index
        @posts = Post.all
    end
    def my_page
        @posts = Post.where(user_id: session[:current_user_id])
        @current_user = User.find_by id: session[:current_user_id]
    end

end
