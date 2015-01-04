class Banner < ActiveRecord::Base

	include ApplicationHelper
	
  attr_accessible :content, :disabled, :target_url, :title, :banner_type
	validates :content, :presence => true

	def options_notice params = nil
		#if params and params[self.class.name.downcase.to_sym].count == 1 and !params[self.class.name.downcase.to_sym][:disabled].nil?
		if params and params[self.class.name.downcase.to_sym].count == 1
			@message = "banner.was_enabled" if params[self.class.name.downcase.to_sym][:disabled] == false
			@message = "banner.was_disabled" if params[self.class.name.downcase.to_sym][:disabled] == true
		else
			if self.disabled
				@message = "banner.saved.disabled"
			else
				@message = "banner.saved.enabled.ok"
				if self.target_url.blank?
					@message = "banner.saved.enabled.without_link"
				else
					@message = "banner.saved.enabled.link_unavailable" if ! check_url self.target_url 
				end
			end
		end
		@message 
	end

	private
	def default_values
		self.disabled ||= false 
	end


end
