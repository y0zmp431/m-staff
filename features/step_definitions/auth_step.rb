# encoding: utf-8

#Допустим /^я пользователь с логином "([^\"]*)" и паролем "([^\"]*)" $/ do |login, passw|
Допустим /^я пользователь c логином "(.*?)" и паролем "(.*?)"$/ do |login, passw|
	user = FactoryGirl.create(:user, login: login, password: passw, password_confirmation: passw)
end

Допустим /^я пользователь c\:$/ do |table|
	user_attr = FactoryGirl.attributes_for :user
	table.rows_hash.each do |row|
		user_attr[row[0].to_sym] = row[1]
		user_attr[:password_confirmation] = row[1] if row[0] == "password"
  end
		puts user_attr
		assert User.create user_attr
end

Если /^создан пользователь с:$/ do |table|
	user_attr = FactoryGirl.attributes_for :user
	table.rows_hash.each do |row|
		user_attr[row[0].to_sym] = row[1]
		user_attr[:password_confirmation] = row[1] if row[0] == "password"
  end
		puts user_attr
		assert User.create user_attr
end


Если /^я создаю пользователя указывая след\. данные:$/ do |table|
		step %{я на странице Регистрация}
		table.rows_hash.each do |row|
			step %{я ввожу в поле "user[#{row[0]}]" значение "#{row[1]}"
}
		end
			step %{кликаю кнопку "Регистрация"}
end

#
Допустим /^я пользователь с e\-mail "(.*?)"$/ do |email|
	user = FactoryGirl.create(:user, email: email)
end

Допустим /^нет пользователя с e-mail "(.*?)"$/ do |email|
	#FactoryGirl.create(:user, email: email)
	if (user = User.find_by_email email)
		user.destroy 
	end
end

Если /^я зарегистрированный пользователь и вхожу на сайт$/ do
	user = FactoryGirl.create(:user, :password => "pass", :password_confirmation => "pass")
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "pass"}
	step %{кликаю кнопку "Войти"}
end

Если /^я не зарегистрированный пользователь и вхожу на сайт$/ do
	if (user = User.find_by_login "no_valid_user")
		user.destroy 
	end
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "no_valid_user"}
  step %{я ввожу в поле "user_session[password]" значение "pass"}
	step %{кликаю кнопку "Войти"}
end

Допустим /^я администратор$/ do
	user = FactoryGirl.create(:admin)
	UserSession.create(user)
	assert UserSession.find("#{user.id}")
end

Допустим /^я не зарегистрированный пользователь$/ do
	#UserSession.all.each{|session| session.destroy }
	User.logged_in.each do |user|
		UserSession.find(user.id).destroy
	end
end

То /^пользователь с email "(.*?)" с паролем "(.*?)" сможет войти на сайт$/ do |email, passwd|
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{email}"}
  step %{я ввожу в поле "user_session[password]" значение "#{passwd}"}
	step %{кликаю кнопку "Войти"}
	id = User.find_by_email(email).id if User.find_by_email(email)
	assert UserSession.find("#{id}")
end

То /^пользователь "(.*?)" с паролем "(.*?)" сможет войти на сайт$/ do |login, password|
	step %{пользователь с email "#{login}" с паролем "#{password}" сможет войти на сайт}
end



То /^пользователь "(.*?)" должен быть аунтентифицирован$/ do  |login|
	id = User.find_by_login(login).id if User.find_by_login(login)
	assert UserSession.find("#{id}")
end

То /^пользователь с email "(.*?)" должен быть аунтентифицирован$/ do  |email|
	id = User.find_by_email(email).id if User.find_by_email(email)
	assert UserSession.find("#{id}")
end

То /^пользователь "(.*?)" не должен быть аунтентифицирован$/ do  |login|
	id = User.find_by_login(login).id if User.find_by_login(login)
	assert_nil UserSession.find("#{id}")
end

То /^пользователь с email "(.*?)" не должен быть аунтентифицирован$/ do  |email|
	id = User.find_by_email(email).id if User.find_by_email(email)
	assert_nil UserSession.find("#{id}")
end
