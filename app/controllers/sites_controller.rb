class SitesController < ApplicationController

  # auto_complete_for :site, :name
  
	def index
		@onload = '$("site_name").focus();'

	end

	def auto_complete_for_site_name
      @items = Site.find(:all, 
        :conditions => [ 'LOWER(name) LIKE ?', 
        '%' + request.raw_post.downcase + '%' ])
        logger.info { "Done auto-complete lookup" }
      render :inline => "<%= auto_complete_result(@items, 'name') %>"
  end

	def show
		@show = params[:site][:name]
		@allurls = Site.find(:all, :conditions=>["name LIKE  ?", "%"+@show+"%"], :order => 'name ASC')
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
    # @sites = Site.find(:all, :conditions => 'name != ""', :order => 'name ASC' )
	  @sites = Site.find_by_sql('SELECT sites.name, sites.url, COUNT(requests.id) as counts 
      FROM sites, requests
      WHERE sites.id=requests.site_id
      GROUP BY sites.name ORDER BY counts DESC LIMIT 3')
    # logger.info "Collected sites; e.g. " + @sites[3].name
    # logger.info "Counted; e.g. " + @scount[2].name
  end


end
