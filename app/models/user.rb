class User < ActiveRecord::Base


  attr_accessible :disabled, :email, :login, :name, :password, :password_confirmation, :roles, :roles_mask
	validates :login, :allow_blank => true,:uniqueness => { :case_sensitive => false }

	include RoleModel
  roles_attribute :roles_mask
	roles :admin, :moderator, :user, :writer

	has_many :articles

	acts_as_authentic do |c|
		c.validate_login_field = false
	end

	after_initialize :init


	def init
    self.disabled ||= 0
    #self.roles_mask = 4
	end

	scope :disabled, -> { where :disabled => true }
	scope :enabled , -> { where :disabled => false }

	def active? 
		  !self.disabled
	end
  
  

	def self.find_by_login_or_email(login)
		  User.find_by_login(login) || User.find_by_email(login)
	end

	def change_random_passwd
		password = SecureRandom.hex(8)
		password_confirmation = password
		save
		password
	end

	def uniq_login_if_exist
		#errors.add(:login, t("user_form.login_is_not_uniq")) if self.login. 
	end

end
