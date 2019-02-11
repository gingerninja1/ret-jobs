class ProfilesController < Devise::RegistrationsController
  
  def index
  end
  
  # GET /resource/sign_up
  def new
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
  
  def search
    if current_user
      user_zip = current_user.profile.zip
    else
      user_zip = Geocoder.search(request.remote_ip).first.postal
    end

    #@profiles = Profile.joins("INNER JOIN users ON users.id = profiles.user_id").where("roles.id = 2 AND zip = #{user_zip}")
    if params[:search]
      @profiles = Profile.joins("INNER JOIN users ON users.id = profiles.user_id
  INNER JOIN user_categories ON user_categories.user_id = users.id
  INNER JOIN categories ON categories.id = user_categories.category_id
  INNER JOIN user_roles ON user_roles.user_id = users.id
  INNER JOIN roles ON roles.id = user_roles.role_id
").where("(first_name LIKE ? OR last_name LIKE ? OR skills LIKE ? OR categories.name LIKE ?) AND roles.id = 2 AND profiles.zip = ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", user_zip).order("last_name ASC").uniq
    else
      @profiles = Profile.joins("INNER JOIN users ON users.id = profiles.user_id").where("role_id = 2 AND zip = ?", user_zip).order("last_name ASC")
    end
    
    render 'results'
  end
  
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

end