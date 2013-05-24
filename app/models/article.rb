class Article < ActiveRecord::Base
  attr_accessible :published, :section, :short_text, :text, :title, :url, :user_id
	belongs_to :user
	acts_as_url :title, :only_when_blank => true, :allow_duplicates => true
	after_initialize :default_values
	validates :title, :url, :text, :presence => true
	validates_associated :user;
	validates :title, :url, :uniqueness => { :case_sensitive => false }

	scope :published, -> { where :published => true}
	scope :unpublished, -> { where :published => false}

	def to_param
		url # or whatever you set :url_attribute to
	end

	private
	def default_values
		self.disabled ||= false
	end

end
