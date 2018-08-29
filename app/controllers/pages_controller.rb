class PagesController < ApplicationController
  
  def index
  end
  
  def about
  end
  
  def help
  end
  
  def neighbors
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
end
