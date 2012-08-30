class RequestsController < ApplicationController
  
  def index
    @requests = Request.order(params[:sort]).paginate(page: params[:page])
  end

  def all
    @requests = Request.order(params[:sort]).paginate(page: params[:page])
  end

  def show
    @request = Request.find(params[:id])
    @activities = @request.activities.all
  end

  def new
    @request = Request.new
  end

  def edit
    @request = Request.find(params[:id])
  end
  
  def receive
    @request = Request.find(params[:id])
    @activities = @request.activities.all
    @request.update_attributes(params[:bclitem][:duedate])
    flash[:notice] = "Received!"
    redirect_to requests_path
  end

  def create
    @request = Request.new(params[:request])
    if @request.save
      redirect_to @request, notice: 'Request was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(params[:request])
      redirect_to @request, notice: 'Request was successfully updated.'
    else
      render action: "edit"
    end
  end

end
