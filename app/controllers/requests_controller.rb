class RequestsController < ApplicationController
  
  def index
    @requests = Request.where(:locationplaced => session[:current_location]).order(params[:sort]).paginate(page: params[:page])
  end

  def all
    @requests = Request.order(params[:sort]).paginate(page: params[:page])
  end

  def show
    @request = Request.find(params[:id])
    @activities = @request.activities.all
  end

  def new
    @default_location = Location.find_by_code(session[:current_location])
    @request = Request.new(:locationplaced => session[:current_location], 
            :location_id => @default_location.id)
    @locations = Location.all
  end

  def edit
    @request = Request.find(params[:id])
    @locations = Location.all
  end
  
  def receive
    @request = Request.find(params[:id])
    @activities = @request.activities.all
#    @request.update_attributes(params[:bclitem][:duedate])
#    flash[:notice] = "Received!"
#    redirect_to requests_path
  end

  def create
    @request = Request.new(params[:request])
    if @request.save
      update_status(@request, 1)
      redirect_to @request, notice: 'Request was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:request])
      unless params[:new_status_id].blank?
        update_status(@request, params[:new_status_id])
      end
      redirect_to @request, notice: 'Request was successfully updated.'
    else
      render action: "edit"
    end
  end

end
