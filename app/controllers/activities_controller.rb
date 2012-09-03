class ActivitiesController < ApplicationController
  def index
    @activities = Activity.unscoped.order(:created_at)
  end
  

  def new
  end

  def edit  
  end

  def create
    request = Request.find(params[:request_id])
    update_status(request, params[:new_status_id])
    redirect_to request_path(request)
  end
  
  def update
  end

  def destroy
    Activity.find(params[:id]).destroy
    flash[:success] = "Activity destroyed."
    redirect_to activities_url
  end
  
  def show
  end
  
  def return
  end

end
