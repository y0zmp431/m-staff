# encoding: utf-8
# language: ru


Допустим /^существует пользователь "(.*?)"$/ do |login|
	user = User.find_by_login(login) || FactoryGirl.create(:user, login: login)
	assert User.find_by_login login
	#UserSession.create(user)
	#assert UserSession.find("#{user.id}")
end


Допустим(/^существует пользователь с:$/) do |table|
	user_attr = FactoryGirl.attributes_for :user
	table.rows_hash.each do |row|
		user_attr[row[0].to_sym] = row[1]
		user_attr[:password_confirmation] = row[1] if row[0] == "password"
  end
	assert User.create_with( user_attr )
end


Допустим /^существует пользователь с e\-mail "(.*?)"$/ do |email|
  #puts "user found" if User.find_by_email(email)
	user = User.find_by_login(email) || FactoryGirl.create(:user, email: email)
	assert User.find_by_email email
	#UserSession.create(user)
	#assert UserSession.find("#{user.id}")
end

Если /^я просматриваю профиль пользователя "(.*?)"$/ do |login|
	user = User.find_by_login login
  visit user_path user
end

Если /^я редактирую профиль пользователя "(.*?)"$/ do |login|
	user = User.find_by_login login
  visit edit_user_path user
end

Если /^я редактирую свой профиль$/ do 
  visit account_path
	click_link("Редактировать")
end

Если /^я редактирую профиль пользователя "(.*?)" вводя:$/ do |login, table|
	user = User.find_by_login login
  visit edit_user_path user
	#puts page.body
  table.rows_hash.each do |row|
#    When %{I fill in "#{name}" with "#{value}"}
		step %{я ввожу в поле "#{row[0]}" значение "#{row[1]}"}
  end
end

Если /^я кликаю ссылку для отключения пользователя "(.*?)"$/ do |login|
	user = User.find_by_login login
	page.should have_selector("a[href='#{disable_user_path user}']")
	find("a[href='#{disable_user_path user}']").click
end

Допустим /^существует неактивный пользователь "(.*?)"$/ do |login|
	user = FactoryGirl.create(:user, login: login, disabled: true)
	assert User.find_by_login(login).disabled
end

То /^я не должен видеть полей изменяющих роли пользователей$/ do
	page.should have_no_selector("input[type='checkbox'][name='user[roles][]']")
end


То /^должен быть создан новый пользователь "(.*?)" с\:$/ do |login, table|
	user = User.find_by_login login
		table.hashes.each do |row|
			row[:value] = row[:value] == true if ["true", "false"].include? row[:value] 
			assert_equal user.attributes[row[:name]], row[:value]
		end
end

То /^у пользователя "(.*?)" должны быть следующие данные\:$/ do |login, table|
	user = User.find_by_login login
		table.hashes.each do |row|
			row[:value] = row[:value] == true if ["true", "false"].include? row[:value] 
			assert_equal user.attributes[row[:name]], row[:value]
		end
end

То /^должен быть создан пользователь "(.*?)"$/ do |login|
	#puts "roles = #{User.find_by_login(login).roles}"
	assert_not_nil User.find_by_login login
end

То /^у пользователя "(.*?)" должны быть привелегии:$/ do |login, table|
	  user = User.find_by_login login
		table.raw.flatten.map  do |role| 
			assert user.is?(role), "User haven't role"
		end
end

То /^я должен видеть ссылку для редактирования данных пользователя "(.*?)"$/ do |login|
	user = User.find_by_login login
	page.should have_selector("a[href='#{edit_user_path user}']")
end

То /^я должен видеть ссылку для отключения пользователя "(.*?)"$/ do |login|
	user = User.find_by_login login
	page.should have_selector("a[href='#{disable_user_path(user)}']")
end

То /^я должен видеть ссылку для просмотра профиля пользователя "(.*?)"$/ do |login|
	user = User.find_by_login login
	page.should have_selector("a[href='#{user_path user}']")
end

То /^я должен видеть ссылку для создания новой учетной записи\.$/ do
	page.should have_selector("a[href='#{new_user_path}']")
end

То /^не должно быть ссылки для удаления пользователя "(.*?)"$/ do |login|
	user = User.find_by_login login
	page.should have_no_selector("a[href='#{user_path user}'][data-method='delete']")
end

То /^я должен вернуться на страницу профиля "(.*?)"$/ do |login|
	user = User.find_by_login login
	assert_equal user_path(user), current_path
end
