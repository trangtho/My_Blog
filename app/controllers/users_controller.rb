class UsersController < ApplicationController
    def index
      
    end

    def sign_in
      @user = User.find_by(username: params['user']['username'], password: params['user']['password'])
      # debugger
      respond_to do |format|
        # debugger
        if @user
          format.html { redirect_to root_path, notice: "User was successfully created." }
        else
          format.html { render :index, status: :unprocessable_entity }
        end
      end
      session[:current_user_id] = @user.id
    end

    def sign_out
      session[:current_user_id] = nil
      # debugger
      redirect_to sign_in_path 
    end
    
      def show
        @user = User.find(params[:id])
      end
    
      def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
    
        respond_to do |format|
          if @user.save
            format.html { redirect_to root_path, notice: "User was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end

      end

      def show
        @user = User.find(params[:id])
        @posts = Post.where(user_id: params[:id])
        @subcription = Subscription.find_by(subcriber_id: params[:id], subcriber_to_id: session[:current_user_id])
        if @subcription
          @status = "Following" 
        else
          @status = "Follow"
        end
      end

      def follow
        # debugger
        @subscription =Subscription.new(subcriber_id: params[:user_id], subcriber_to_id: session[:current_user_id])
        @user = User.find(params[:user_id])
        
        if @subscription.save
          respond_to do |format|
            format.js {render inline: "location.reload();" }
          end
          # flash[:notice] = "You are now following #{@user.username}"
          # redirect_to user_path(@user)  # Redirect back to user's profile page (or desired location)
        else
          flash[:alert] = "Error following user"  # Set appropriate error message
          render :show  # Re-render current page (or handle error redirection)
        end

      end

      def unfollow
        # debugger
        @subscription_to_delete = Subscription.find_by(subcriber_id: params[:user_id], subcriber_to_id: session[:current_user_id])
        @subscription_to_delete.destroy
        respond_to do |format|
          format.js {render inline: "location.reload();" }
        end
      end
    
      private
        def user_params
          params.require(:user).permit(:username, :password)
        end
end
