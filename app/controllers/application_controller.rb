require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  protect_from_forgery with: :exception

  # authorize_resource

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to welcome_path, alert: exception.message
  # end



  def after_sign_in_path_for(resource)
    welcome_path
  end
end
