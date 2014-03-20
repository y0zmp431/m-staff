# encoding: utf-8
# language: ru
#
require 'cucumber/autocomplete'

Если /^выбираю "(.*?)" в выпавшем списке$/  do |value|
  #step %{кликаю ссылку "#{value}"}
  step %{I choose "#{value}" in the autocomplete list}
end
