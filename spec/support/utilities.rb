include ApplicationHelper

def valid_signin(user)
  fill_in "Location", with: user.locationcode
  fill_in "Password", with: user.password
  click_button "Sign In"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

def full_title(page_title)
  base_title = "ILL Requests"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

