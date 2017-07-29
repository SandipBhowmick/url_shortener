include Rails.application.routes.url_helpers
class Url < ApplicationRecord
	validates_presence_of :full_url, :message => '^Please paste URL' 
	validates_uniqueness_of :full_url, :message => '^'

	after_find do |url|
    	self.update_attributes(:count =>(self.count+ 1))   
  	end 
end
