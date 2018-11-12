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
    @profiles = Profile.all
    if params[:search]
      @profiles = Profile.joins("INNER JOIN users ON users.id = profiles.user_id
  INNER JOIN user_categories ON user_categories.user_id = users.id
  INNER JOIN categories ON categories.id = user_categories.category_id
").where("first_name LIKE ? OR last_name LIKE ? OR bio LIKE ? OR skills LIKE ? OR categories.name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC").uniq
    else
      @profiles = Profile.all.order("created_at DESC")
    end
    
    render 'results'
  end
  
end