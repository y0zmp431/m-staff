# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    User.create(:login => "admin", :name => 'Илья', :email => 'ilp416@gmail.com', :password => 'admin', :password_confirmation => 'admin', :roles_mask => '1', :disabled => false)
		Article.create(:url => "index", :title => 'Index', :text => 'Index page', :published => true, :user_id => User.find_by_login("admin").id);
    Dog.create(:url => 'nomka', :name => "Номка", :fullname => "Amelinka NomiStar Aleksa's House", :male => 0, :date_of_birth => "2010-08-20", :desc => "Описание Номи-Муми", :pedigree => "http://chhcrested.be/")
    Dog.create(:url => 'toshi', :name => "Тоши", :fullname => "Addjo Toshi Aleksa's House", :male => 1, :date_of_birth => "2010-08-20", :desc => "Описание Тошасенький-Тонюсенький", :pedigree => "http://chhcrested.be/", :for_love => true)
    Dog.create(:url => 'shik', :name => "Шик", :fullname => "Dajhan Shik Aleksa's House", :male => 1, :date_of_birth => "2013-06-09", :desc => "Описание Шика", :pedigree => "http://chhcrested.be/", :for_sale => true)
