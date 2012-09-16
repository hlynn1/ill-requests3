desc "Update request index view with current status name"
task :update_current_status => :environment do
  Request.find_all_by_current_status(nil).each do |request|
    latest_activity = Activity.where("request_id = ?", request.id).maximum("status_id")
    request.update_column(:current_status, latest_activity)
  end
end