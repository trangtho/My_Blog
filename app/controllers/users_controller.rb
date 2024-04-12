class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @posts = Post.where(user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(3)
      @subcription = Subscription.find_by(subcriber_to_id: params[:id], subcriber_id: current_user.id)
      if @subcription
        @status = "Following" 
      else
        @status = "Follow"
      end
    end

    def follow
      subscription = current_user.subcribers.create(subcriber_to_id: params[:user_id])
        
      if subscription.save
        respond_to do |format|
          format.js {render inline: "location.reload();" }
        end
      else
        flash[:alert] = "Error following user" 
        render :show  
      end
    end

    def unfollow
      subscription = current_user.subcribers.find_by(subcriber_to_id: params[:user_id])
      subscription.destroy
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
    end
    
    private
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
end
