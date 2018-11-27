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
    @profiles = Profile.joins("INNER JOIN users ON users.id = profiles.user_id").where("role_id = 2")
    if params[:search]
      @profiles = Profile.joins("INNER JOIN users ON users.id = profiles.user_id
  INNER JOIN user_categories ON user_categories.user_id = users.id
  INNER JOIN categories ON categories.id = user_categories.category_id
  INNER JOIN user_roles ON user_roles.user_id = users.id
  INNER JOIN roles ON roles.id = user_roles.role_id
").where("first_name LIKE ? OR last_name LIKE ? OR bio LIKE ? OR skills LIKE ? OR categories.name LIKE ? AND roles.id = 2", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC").uniq
    else
      @profiles = Profile.joins("INNER JOIN users ON users.id = profiles.user_id").where("role_id = 2").order("created_at DESC")
    end
    
    render 'results'
  end
  
end