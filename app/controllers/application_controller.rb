class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.permit(:email, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :country, :phone_1, :bio, :skills, :pricing, :avatar, :social_fb, :social_in], category_ids: [])
    }
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:email, :password, :password_confirmation, :current_password, profile_attributes: [:id, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :country, :phone_1, :bio, :skills, :pricing, :avatar, :social_fb, :social_in], category_ids: [])
    }
  end
end
