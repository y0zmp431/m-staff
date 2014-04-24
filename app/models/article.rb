class Article < ActiveRecord::Base
  attr_accessible :published, :section, :short_text, :text, :title, :url, :user_id, :tag_list
	belongs_to :user
	acts_as_url :title, :only_when_blank => true, :allow_duplicates => true
  acts_as_taggable
	validates :title, :url, :text, :presence => true
	validates_associated :user
  validates_format_of :url, :with => /^[-_a-zA-Z0-9]+$/, :message => :url_format
	validates :title, :url, :uniqueness => { :case_sensitive => false }

	scope :published, -> { where :published => true}
	scope :unpublished, -> { where :published => false}

	def to_param
		url # or whatever you set :url_attribute to
	end

	private
	def default_values
		self.published ||= true
	end

end
