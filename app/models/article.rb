class Article < ActiveRecord::Base
  attr_accessible :active, :section, :short_text, :text, :title, :url, :user_id
	belongs_to :user
	acts_as_url :title

	def to_param
		url # or whatever you set :url_attribute to
	end
end
