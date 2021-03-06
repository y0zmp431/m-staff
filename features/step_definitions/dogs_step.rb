# encoding: utf-8
# language: ru

Допустим /^существует собака "(.*?)"$/ do |name|
	dog = Dog.find_by_name(name) || FactoryGirl.create(:dog, name: name)
	assert Dog.find_by_name name
end

Допустим(/^существует скрытая собака "(.*?)"$/) do |name|
	dog = Dog.find_by_name(name) || FactoryGirl.create(:dog, name: name, disabled: true)
	assert Dog.find_by_name(name).disabled?
end

То /^у собаки "(.*?)" должна быть фотография$/ do |name|
  dog = Dog.find_by_name( name )
  assert_equal dog.photos.count, 1
end

То(/^у собаки "(.*?)" должна быть аватарка$/) do |name|
  dog = Dog.find_by_name( name )
  assert dog.avatar_file_name
end
