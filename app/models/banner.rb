class Banner < ActiveRecord::Base
  attr_accessible :content, :disabled, :target_url, :title, :banner_type
	validates :content, :presence => true


	private
	def default_values
		self.disabled ||= false 
	end
end
