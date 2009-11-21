class SitesController < ApplicationController

	auto_complete_for :site, :name
  in_place_edit_for :site, :url

	def index
		#@onload = 'document.getElementById("site_name").focus();'
		@onload = '$("site_name").focus();'
		
		#
    # ActionController::Routing::Routes.named_routes.routes.each do |name, route|
    # 
    # puts "%20s: %s" % [name, route]
  	#
    # end
		
		
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
    logger.info "Routed to new ok"
    @site = Site.new
    # redirect_to "/sites"
	end
	
	def create
		@site = Site.new(params[:site])
		@site.save
		redirect_to "/sites"
	 
	end
	
	def list
	  @sites = Site.find(:all, :conditions => 'name != ""', :order => 'name ASC' )
	  @scount = Site.find_by_sql('SELECT *, COUNT (requests.id) AS counts FROM requests INNER JOIN sites ON sites.id=requests.site_id GROUP BY name')
    logger.info "Counted; e.g. " + @scount[1].name
    # SELECT (name), COUNT (requests.id) FROM requests INNER JOIN sites ON sites.id=requests.site_id GROUP BY name
	  
	end


end
