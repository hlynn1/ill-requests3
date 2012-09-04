class CustomersController < ApplicationController

  def index
    @customers = Customer.order('lastname').paginate(page: params[:page],:per_page => 20)
  end

  def show
    @customer = Customer.find(params[:id])
    @requests = Request.where(:customer_id => @customer.id).order('dateplaced DESC').paginate(page: params[:page])
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

end
