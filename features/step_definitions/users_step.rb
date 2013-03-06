# encoding: utf-8
# language: ru



То /^(?:|я )должен быть создан пользователь "(.*?)" с\:$/ do |login, table|
	user = User.find_by_login login
		table.hashes.each do |row|
			assert user.attributes[row[:name]], row[:value]
		end
end

То /^(?:|я )должен быть создан пользователь "(.*?)"$/ do |login|
	assert_not_nil User.find_by_login login
end

То /^у пользователя "(.*?)" должны быть привелегии:$/ do |login, table|
	  user = User.find_by_login login
		table.hashes.each do |row|
			user.
		end
end


