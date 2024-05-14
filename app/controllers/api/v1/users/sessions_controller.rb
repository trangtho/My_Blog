# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  include ActionController::Helpers
  include ActionController::Flash

  respond_to :json

  def destroy
    @authenticated = true
    super
  end

  private

  def verify_signed_out_user
    current_user
    super
  end

  def respond_to_on_destroy
    if @authenticated && current_user.nil?
      # current_user is logged out successfully
      render json: { status: { code: 200, message: 'Logged out successfully.' } }
    else
      # current_user is not logged out successfully
      render status: :unprocessable_entity
    end
  end

  def respond_with(_resource, _opts = {})
    if current_user
      render json: {
        user: current_user.as_json(except: :jti)
      }, status: :ok
    else
      # current_user is not logged in successfully
      render json: {
        messages: ['Invalid Email or Password.']
      }, status: :unprocessable_entity
    end
  end
end
