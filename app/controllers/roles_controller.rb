class RolesController < ApplicationController
  before_action :set_role, only: [:edit, :update, :show, :destroy]
  skip_before_action :authenticate_user!, except: [:show]
  
  def index
    @roles = Role.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @role = Role.new
  end
  
  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = "Role was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @role.update(role_params)
      flash[:success] = "Role name was successfully updated"
      redirect_to role_path(@role)
    end
  end
  
  def show
    @role_articles = @role.roles.paginate( page: params[:page], per_page: 5)
  end
  
  private
  
  def set_role
    @role = Role.find(params[:id])
  end
  
  def role_params
    params.require(:role).permit(:name, :description)
  end
  
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
  
end