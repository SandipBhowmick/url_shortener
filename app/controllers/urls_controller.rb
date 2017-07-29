class UrlsController < ApplicationController

	before_action :generate_shortened, :only => [:create]

	def index
		@url = Url.new()
		@urls = Url.all.order("count DESC").limit(100)		
	end

	def generate_shortened
		@@shortened_url= SecureRandom.urlsafe_base64(4)
		if (Url.find_by_shortened_url(@@shortened_url))
			generate_shortened			
		end		
	end

	

	def create
		@url = Url.new(url_params)		
		@url.shortened_url= @@shortened_url		
		if @url.save
			redirect_to root_path
	  	else	
	  		flash[:notice]= (@url.errors.full_messages).join.to_s
	  		redirect_to root_path	  		
	    end
	end


	def show
		url = Url.find_by_shortened_url(params[:id])
		redirect_to url.full_url
	end

	private
		def url_params			
			params.require(:url).permit(:shortened_url,:full_url)			
		end
end
