# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  USER_NAME, PASSWORD = "user", "pr0t3ct!forN0W"

  # before_filter :authenticate



  private

    def authenticate

      authenticate_or_request_with_http_basic do |user_name, password|

        user_name == USER_NAME && password == PASSWORD

      end

    end


end
