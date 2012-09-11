class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  require 'worldcat'

  def update_status(request,new_status)
    Activity.create!(:request_id => request.id, :status_id => new_status)
  end  

  def get_bib_info(oclcnum)
    client = WorldCat.new 'q9hE7m5MlHC0MQqPMOR1fMbj7DDXNnK5rllMI7Ekwp7vubtyABZc1IL68B8cRoulBuhKvw19krKnBsG4'
    r = client.single_record(:oclc => oclcnum)
    @author = r["100"]["a"]
    maintitle = r["245"]["a"]
    subtitle = r["245"]["b"]
    @title = "#{maintitle} #{subtitle}"
    publisher = r["260"]["b"]
    year = r["260"]["c"]
    @pub = "#{publisher} #{year}"
  end


end
