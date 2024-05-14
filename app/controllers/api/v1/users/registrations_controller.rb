# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  include ActionController::Helpers
  include ActionController::Flash
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if request.method == 'DELETE'
      # current_user is destroyed successfully
      render status: :ok
    elsif request.method == 'POST' && resource.persisted?
      # current_user is created successfully
      render json: {
        user: resource
      }, status: :ok
    else
      # current_user is not created successfully
      render json: {
        messages: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end
