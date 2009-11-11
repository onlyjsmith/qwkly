class SitesController < ApplicationController

	auto_complete_for :site, :name

	def index
		#@onload = 'document.getElementById("site_name").focus();'
		@onload = '$("site_name").focus();'
	end

	#def auto_complete_for_site_name
	#	puts "autocomplete" + params[:site][:name]
	#end


	def show
		@show = params[:site][:name]
		puts @show
		@url = Site.find(:first, :conditions=>["name LIKE  ?", "%"+@show+"%"])
		@url2 = @url.url
		@term = params[:term]
		puts @url.url
		puts @url2
		
		@combined = @url2 + @term
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
