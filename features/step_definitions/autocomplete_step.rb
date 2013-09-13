# encoding: utf-8
# language: ru
#
Если /^выбираю "(.*?)" в выпавшем списке$/ do |value|
  step %{кликаю ссылку "#{value}"}
end
