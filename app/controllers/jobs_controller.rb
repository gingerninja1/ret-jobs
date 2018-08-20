class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :show, :destroy]
  skip_before_action :authenticate_user!, except: [:show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @jobs = Job.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @job = Job.new
  end
  
  def edit
  end
  
  def create
    #render plain: params[:job].inspect
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      flash[:success] = "Job was successfully created."
      redirect_to job_path(@job)
    else
      render 'new'
    end
  end
  
  def update
    if @job.update(job_params)
      flash[:success] = "Job was successfully updated."
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @job.destroy
    flash[:danger] = "Job was successfully deleted."
    redirect_to jobs_path
  end
  
  private
  
  def set_job
    @job = Job.find(params[:id])
  end
  
  def job_params
    params.require(:job).permit(:title, :description, :price, category_ids: [])  
  end
  
  def require_same_user
    if current_user != @job.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own job"
      redirect_to root_path
    end
  end
  
end