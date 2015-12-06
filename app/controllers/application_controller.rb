class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  check_authorization unless: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to welcome_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    welcome_path
  end
end
