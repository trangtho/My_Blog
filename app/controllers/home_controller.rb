class HomeController < ApplicationController
    def index
        @posts = Post.order(created_at: :desc).page(params[:page]).per(3)
    end
    def search

          if params[:term].present?
            @posts = Post.where("lower (posts.title) ILIKE :value OR 
                                                 lower (posts.content) ILIKE :value", 
                                                 value: "%#{params[:term].downcase}%" )
        else
            @posts = Post.all.order(created_at: :DESC)
        end
    end

end
