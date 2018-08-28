class ProfilesController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end
  
end