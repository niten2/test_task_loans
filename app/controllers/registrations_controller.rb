class RegistrationsController < Devise::RegistrationsController

  # skip_authorize_resource
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
