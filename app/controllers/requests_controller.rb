class RequestsController < ApplicationController

  def index
    @requests = Request.paginate(page: params[:page])
  end

  def show
    @request = Request.find(params[:id])
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
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

end
