class RequestsController < ApplicationController
  
  def index
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

  def create
    @request = Request.new(params[:request])

    respond_to do
      if @request.save
        redirect_to @request, notice: 'Request was successfully created.'
      else
        render action: "new"
      end
    end
  end

  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        redirect_to @request, notice: 'Request was successfully updated.'
      else
        render action: "edit"
      end
    end
  end

end
