class SitesController < ApplicationController

	auto_complete_for :site, :name

	def index
		#@onload = 'document.getElementById("site_name").focus();'
		@onload = '$("site_name").focus();'
	end

	def show
		@show = params[:site][:name]
		@url = Site.find(:first, :conditions=>["name LIKE  ?", "%"+@show+"%"])
		@term = params[:term]
    user_ip = request.remote_ip
    user_agent = request.user_agent
    puts user_agent
		@request = Request.new(:site_id => @url.id, :term => params[:term], :ip => user_ip)
		@request.save
		@combined = @url.url + @term
    redirect_to "http://#{@combined}"
		
	end

	def new

    @site = Site.new(params[:site])
		@site.save
    redirect_to "/sites"
	end
	
	def create
		redirect_to "/sites"
	 
	end


end
