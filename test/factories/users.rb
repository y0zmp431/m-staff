# encoding: utf-8
#

#FactoryGirl.sequence :email do |n|
#  "test#{n}@example.com"
#end

FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@mordor.com" }

  factory :user do
		login "user"
    name "Федор Сумкин"
		email
    #email "frodo@mordor.com"
		password "user1"
		password_confirmation "user1"
		roles_mask 4
	  disabled false	
  end
	
  factory :user1 do
		login "user1"
    name "Дэвид Кроули"
    email
#    email { Factory.next(:email) }
		password "user1"
		password_confirmation "user1"
		roles_mask 4
	  disabled false	
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    login "Admin"
    name  "admin"
    email
		password "admin"
		password_confirmation "admin"
		roles_mask 1
	  disabled false	
  end

  factory :writer, class: User do
    login "writer"
    name  "writer"
    email
		password "writer"
		password_confirmation "writer"
		roles_mask 1
	  disabled false	
  end
end

