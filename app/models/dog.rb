# encoding: utf-8
#
class Dog < ActiveRecord::Base
  attr_accessible :date_of_birth, :desc, :disabled, :for_love, :for_sale, :from_us, :fullname, :male, :name, :owner_desc, :pedigree, :url
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :photos
	acts_as_url :name, :only_when_blank => true
	validates :name, :url, :presence => true
	validates :name, :url, :uniqueness => { :case_sensitive => false }

	def to_param
		url # or whatever you set :url_attribute to
	end

  def sex
    return "male" if self.male
     "female" 
  end
  
  def age
    # Difference in years, less one if you have not had a birthday this year.
    a = self.date_of_birth.year - Date.today.year
    a = a - 1 if (
         bd.month >  d.month or 
        (bd.month >= d.month and bd.day > d.day)
    )
    a

  end

end
