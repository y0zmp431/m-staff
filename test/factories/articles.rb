
# encoding: utf-8
#
FactoryGirl.define do

  factory :article do
		title "index"
		text "index page" 
		published "true"
    before(:create) do |article|
      article.user = User.find_by_login('writer') || FactoryGirl.create(:writer)
    end
	end

end

