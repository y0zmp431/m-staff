class User < ActiveRecord::Base

  attr_accessible :disabled, :email, :login, :name, :password, :password_confirmation, :roles, :roles_mask

	has_many :articles

	acts_as_authentic

	after_initialize :init


	def init
    self.disabled ||= 0
	end
  
  
  ROLES = %w[admin moderator user]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def role_symbols
    roles.map(&:to_sym)
  end

	def is?(role)
		  roles.include?(role.to_s)
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
end
