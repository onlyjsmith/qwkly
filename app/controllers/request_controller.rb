class RequestController < ApplicationController

  USER_ID, PASSWORD = "a", "z"

  layout "sites"
  # before_filter :check_logged_in

  def list
  @requests = Request.find(:all, :order => 'created_at DESC', :limit => 4)
  logger.info "Yo"
  end

private 
  def check_logged_in
    authenticate_or_request_with_http_basic do |id, password| 
             id == USER_ID && password == PASSWORD
    end
  end
  
end
