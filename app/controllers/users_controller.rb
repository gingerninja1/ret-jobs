class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, except: [:index]
  before_action :require_admin, only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user_jobs = @user.jobs.paginate(page: params[:page], per_page: 5)
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :phone_1, :username, :email, :password, role_ids: [])
  end
  
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
  
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
  
end
