# encoding: utf-8
#
class Dog < ActiveRecord::Base
  attr_accessible :date_of_birth, :date_of_death, :desc, :disabled, :for_love, :for_sale, :from_us, :fullname, :male, :name, :owner_desc, :pedigree, :url, :avatar, :sort_index, :medical_tests, :trophies, :in_kennel, :litter_sym
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :photos
	belongs_to :litter, foreign_key: :litter_sym, primary_key: :litter_sym

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	acts_as_url :name, :only_when_blank => true
	validates :name, :url, :presence => true
	validates :name, :url, :uniqueness => { :case_sensitive => false }

	default_scope order('sort_index DESC')
	scope :for_sale, -> { where for_sale: true }

	def gallery
		self.photos.where only_for_pets_album: false
	end

	def pets_photos
		self.photos.where(only_for_pets_album: true).order("photos.index_of_order ASC")
	end

	def to_param
		url # or whatever you set :url_attribute to
	end

  def self.find_with_params params
    if params[:show_hidden]
      @dogs = self.where :disabled => true
    else 
      @dogs = self.where :disabled => false
    end
    @dogs = @dogs.where(male: true, in_kennel: true) if params[:male]
    @dogs = @dogs.where(male: false, in_kennel: true) if params[:female]
    @dogs = @dogs.where for_sale: true if params[:for_sale]
    @dogs = @dogs.where from_us: true if params[:from_us]
		@dogs
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
