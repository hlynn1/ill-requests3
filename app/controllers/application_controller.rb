class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def update_status(request,new_status)
    Activity.create!(:request_id => request.id, :status_id => new_status)
  end  

end
