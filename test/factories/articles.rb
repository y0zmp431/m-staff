
# encoding: utf-8
#
FactoryGirl.define do

  factory :article do
		title "index"
		text "index page" 
		published "true"
		
		#if @writer = User.find_by_login("writer") 
		before :create do |a|
			@writer = User.find_by_login("writer") || FactoryGirl.create(:writer) 
				a.user = @writer
		end
		#else
		#	association :user, factory: :writer 
		#end
	end

end

