class PagesController < ApplicationController
  
  def index
    @local_users = Profile.where(zip: Geocoder.search(request.remote_ip).first.postal)
    @best_reviews = Review.where(rating: 5).order(created_at: :desc)
  end
  
  def about
  end
  
  def help
  end
  
  def neighbors
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
end
