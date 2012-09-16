class CustomersController < ApplicationController

  def index
    @customers = Customer.where('lastname ILIKE :s OR firstname ILIKE :s OR userID ILIKE :s', :s => "%#{params[:search]}%").order(params[:sort]).paginate(page: params[:page],:per_page => 20)
  end

  def show
    @customer = Customer.find(params[:id])
    @requests = Request.includes(:status).where(:customer_id => @customer.id).order(params[:sort]).paginate(page: params[:page])
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(params[:customer])
  end

  def update
    @customer = Customer.find(params[:id])
  end

private

  def store_location
    session[:return_to] = request.url
  end

end
