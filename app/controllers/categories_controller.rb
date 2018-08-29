class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :show, :destroy]
  skip_before_action :authenticate_user!, except: [:show]
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @category.update(category_params)
      flash[:success] = "Category name was successfully updated"
      redirect_to category_path(@category)
    end
  end
  
  def show
    @category_users = @category.users.paginate( page: params[:page], per_page: 5)
  end
  
  private
  
  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?)
      flash[:danger] = "Only admins can perform that action."
      redirect_to categories_path
    end
  end
  
end