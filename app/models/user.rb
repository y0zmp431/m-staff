class User < ActiveRecord::Base
  attr_accessible :active, :email, :login, :name, :password, :password_confirmation
	acts_as_authentic do |c|
		#c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
	end # block optional
end
