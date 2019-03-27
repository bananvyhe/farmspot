class ApplicationController < ActionController::Base
  # шаг списания 
  $stepcash = 0.38
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	include JWTSessions::RailsAuthorization 
	rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  def not_authorized
    render json: { error: 'Неавторизован' }, status: :unauthorized
  end

end
