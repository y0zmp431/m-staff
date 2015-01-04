class Contact < ActiveRecord::Base
  attr_accessible :adress, :desc, :email, :gtalk, :main_phone, :phones, :skype
end
