class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :about]

  def index
  end
  
  def about
  end
  
  def help
  end
  
end
