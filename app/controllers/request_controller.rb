class RequestController < ApplicationController

before_filter :check_logged_in, :only => [:list]

  def list
  @requests = Request.find(:all)
  
  end

private 
  def check_logged_in
    authenticate_or_request_with_http_basic("Request List needs a password") do |username, password|
      username == "admin" && password == "whocar22"
    end
  end
  
end
