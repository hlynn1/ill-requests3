class RequestsController < ApplicationController
  before_filter :find_request, :only => [:show, :edit, :update, :receive]
  before_filter :locations_dropdown, :only => [:new, :edit]

  def index
    @requests = Request.here(session[:current_location]).by_column(params[:sort]).active.paginate(page: params[:page])
  end

  def all
    @requests = Request.includes(:status).by_column(params[:sort]).paginate(page: params[:page])
  end

  def show
    @activities = @request.activities.all
  end

  def new
    @default_location = Location.find_by_code(session[:current_location])
    session[:current_item] ||= params[:n]
    unless session[:current_item].blank?
      get_bib_info(session[:current_item])
      @request = Request.new(:locationplaced => session[:current_location], :location_id => @default_location.id,
        :oclcnum => session[:current_item], :author => @author, :title => @title, :pub => @pub, :customer_id => params[:custid])
    else
      @request = Request.new(:locationplaced => session[:current_location], :location_id => @default_location.id, :customer_id => params[:custid])
    end
    unless params[:custid].blank?
      @customer = Customer.find(params[:custid])
    else
    end
  end

  def edit
  end
  
  def receive
  end

  def create
    @request = Request.new(params[:request])
    if @request.save
      update_status(@request, 2)
      redirect_to @request, notice: 'Request was successfully created.'
    else
      render action: "new"
    end
    session[:current_item] = nil
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

    def update_status(request,new_status)
      Activity.create!(:request_id => request.id, :status_id => new_status)
    end

 end
