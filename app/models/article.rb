class Article < ActiveRecord::Base
  attr_accessible :disabled, :section, :short_text, :text, :title, :url, :user_id
	belongs_to :user
	acts_as_url :title
	after_initialize :default_values

	def to_param
		url # or whatever you set :url_attribute to
	end

	private
	def default_values
		self.disabled ||= false
	end

end
