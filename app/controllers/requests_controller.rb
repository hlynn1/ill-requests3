class RequestsController < ApplicationController
  before_filter :find_request, :only => [:show, :edit, :update, :receive]
  before_filter :locations_dropdown, :only => [:new, :edit]

  def index
    @requests = Request.where(:locationplaced => session[:current_location]).by_column(params[:sort]).paginate(page: params[:page])
  end

  def all
    @requests = Request.by_column(params[:sort]).paginate(page: params[:page])
  end

  def show
    @activities = @request.activities.all
  end

  def new
    @default_location = Location.find_by_code(session[:current_location])
    unless params[:n].blank?
      get_bib_info(params[:n])
      @request = Request.new(:locationplaced => session[:current_location], :location_id => @default_location.id,
        :oclcnum => params[:n], :author => @author, :title => @title, :pub => @pub)
    else
      @request = Request.new(:locationplaced => session[:current_location], :location_id => @default_location.id)
    end
  end

  def edit
  end
  
  def receive
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
    if @request.update_attributes(params[:request])
      unless params[:new_status_id].blank?
        update_status(@request, params[:new_status_id])
      end
      redirect_to @request, notice: 'Request was successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  
    def find_request
      @request = Request.find(params[:id])
    end

    def locations_dropdown
      @locations = Location.all
    end

 end
