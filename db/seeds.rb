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
