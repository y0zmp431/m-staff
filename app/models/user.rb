class User < ActiveRecord::Base

  attr_accessible :active, :email, :login, :name, :password, :password_confirmation, :roles, :roles_mask

	has_many :articles

	acts_as_authentic do |c|
		#c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
	end # block optional
	acts_as_authentic
  
  
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
end
