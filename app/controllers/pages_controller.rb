class PagesController < ApplicationController
  
  def index
    if current_user
      user_zip = current_user.profile.zip
    else
      user_zip = Geocoder.search(request.remote_ip).first.postal
    end
    
    @local_users = Profile.where(zip: Geocoder.search(request.remote_ip).first.postal)
    @best_reviews = Review.joins(:profile).where("profiles.zip = ? AND rating = ?", user_zip, 5).order(created_at: :desc)
  end
  
  def about
  end
  
  def help
  end
  
  def neighbors
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
end
