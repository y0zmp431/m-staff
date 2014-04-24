# encoding: utf-8
# language: ru

Допустим(/^в контактной информации указан адрес "(.*?)"$/) do |new_adress|
  @info = Contact.first || Contact.create
  @info.adress = new_adress
  assert @info.save
end
