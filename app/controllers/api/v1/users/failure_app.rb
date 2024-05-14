class Api::V1::Users::Users::FailureApp < Devise::FailureApp
    def http_auth
      redirect_to new_user_session_path
    end
  end