class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  def after_sign_in_path_for(resource_or_scope)
    edit_user_registration_path(current_user)
  end

  def after_sign_out_path_for(resource_or_scope)
    #URI.parse(request.referer).path if request.referer
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.permit(:email, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :country, :phone_1, :bio, :skills, :pricing, :avatar, :social_fb, :social_in], role_ids: [], category_ids: [])
    }
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:email, :password, :password_confirmation, :current_password, profile_attributes: [:id, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :country, :phone_1, :bio, :skills, :pricing, :avatar, :social_fb, :social_in], role_ids: [], category_ids: [])
    }
  end
end
