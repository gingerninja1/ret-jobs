class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_jobs = @user.jobs.all
  end
  
end
