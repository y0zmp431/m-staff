# encoding: utf-8

#Допустим /^я пользователь с логином "([^\"]*)" и паролем "([^\"]*)" $/ do |login, passw|
Допустим /^я пользователь c логином "(.*?)" и паролем "(.*?)"$/ do |login, passw|
	user = FactoryGirl.create(:user, login: login, password: passw, password_confirmation: passw)
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{user.password}"}
	step %{кликаю кнопку "Войти"}
	assert_equal controller.session["user_credentials"], user.persistence_token
end

Допустим /^я пользователь c\:$/ do |table|
	user_attr = FactoryGirl.attributes_for :user
	table.rows_hash.each do |row|
		user_attr[row[0].to_sym] = row[1]
		user_attr[:password_confirmation] = row[1] if row[0] == "password"
  end
	user = User.create user_attr
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{user.password}"}
	step %{кликаю кнопку "Войти"}
	assert_equal controller.session["user_credentials"], user.persistence_token
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
		step %{я на странице Новый пользователь}
		table.rows_hash.each do |row|
			step %{я ввожу в поле "user[#{row[0]}]" значение "#{row[1]}"
}
		end
			step %{кликаю кнопку "Сохранить"}
end

Если /^я регистрируюсь указывая след\. данные:$/ do |table|
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
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{user.password}"}
	step %{кликаю кнопку "Войти"}
	assert_equal controller.session["user_credentials"], user.persistence_token
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

  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{user.password}"}
	step %{кликаю кнопку "Войти"}
#	assert UserSession.find(user.id), "User login faled."
	assert_equal controller.session["user_credentials"], user.persistence_token
end

Допустим /^я писатель$/ do
	user = FactoryGirl.create(:writer)
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{user.password}"}
	step %{кликаю кнопку "Войти"}
	assert_equal controller.session["user_credentials"], user.persistence_token
end

Допустим /^я простой пользователь$/ do 
	user = FactoryGirl.create(:user)
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{user.password}"}
	step %{кликаю кнопку "Войти"}
	assert_equal controller.session["user_credentials"], user.persistence_token
end

Допустим /^я пользователь "(.*?)"$/ do |login|
	user = FactoryGirl.create(:user, :login => login)
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{user.login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{user.password}"}
	step %{кликаю кнопку "Войти"}
	assert_equal controller.session["user_credentials"], user.persistence_token
end

Допустим /^я не зарегистрированный пользователь$/ do
	#UserSession.all.each{|session| session.destroy }
	User.logged_in.each do |user|
		UserSession.find(user.id).destroy
	end
end

То /^пользователь с email "(.*?)" с паролем "(.*?)" сможет войти на сайт$/ do |email, password|
	UserSession.find(User.find_by_email(email).id).destroy
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{email}"}
  step %{я ввожу в поле "user_session[password]" значение "#{password}"}
	step %{кликаю кнопку "Войти"}
	step %{должен увидеть текст "Выход"}
	user = User.find_by_email email
	assert UserSession.create user
	#assert_equal controller.session["user_credentials"], user.persistence_token
	#id = User.find_by_email(email).id if User.find_by_email(email)
	#assert UserSession.find("#{id}").valid?
end

То /^пользователь "(.*?)" с паролем "(.*?)" сможет войти на сайт$/ do |login, password|
	UserSession.find(User.find_by_login(login).id).destroy
  step %{я на странице Авторизация}
  step %{я ввожу в поле "user_session[login]" значение "#{login}"}
  step %{я ввожу в поле "user_session[password]" значение "#{password}"}
	step %{кликаю кнопку "Войти"}
	step %{должен увидеть текст "Выход"}
	user = User.find_by_login login
	assert UserSession.create user
	#assert_equal controller.session["user_credentials"], user.persistence_token
end

То /^пользователь "(.*?)" не сможет войти на сайт$/ do |login|
	user = User.find_by_login login
	@session = UserSession.create user
#	assert ! @session.valid?
	assert_nil controller.session["user_credentials"]
end




То /^пользователь "(.*?)" должен быть аунтентифицирован$/ do  |login|
	user = User.find_by_login(login)
	#assert UserSession.find("#{id}")
	assert_equal controller.session["user_credentials"], user.persistence_token
end

То /^пользователь с email "(.*?)" должен быть аунтентифицирован$/ do  |email|
	user = User.find_by_email(email)
	assert_equal controller.session["user_credentials"], user.persistence_token
end

То /^пользователь "(.*?)" не должен быть аунтентифицирован$/ do  |login|
	user = User.find_by_login(login)
	assert_nil controller.session["user_credentials"]
end

То /^пользователь с email "(.*?)" не должен быть аунтентифицирован$/ do  |email|
	user = User.find_by_email(email)
	assert_nil controller.session["user_credentials"]
end
