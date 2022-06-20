require "application_responder"

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  self.responder = ApplicationResponder
  respond_to :html, :json

  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  private

  def not_destroyed(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end
end
