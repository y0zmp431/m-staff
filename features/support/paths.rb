# encoding: utf-8
# language: ru

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
   
    when /Главная/
      '/'     
    when /Авторизация/
      '/login'     
    when /Выход/
      '/logout'     
    when /Регистрация/
      '/signup'     
    when /Восстановление пароля/
      '/recovery_passwd'     
    when /Регистрация нового пользователя/
      '/users/new'
    when /Мой профиль/
      '/account'
    when /Пользователи/
      '/users'
    when /Страница пользователя/
      '/account'
    when /Новая статья/
      '/articles/new'
    when /Список статей/
      '/articles/'
    when /Список неопубликованных статей/
      '/articles?unpublished=true'
    when /Редактирование статьи "(.+)"/
      edit_article_path(Article.find_by_title($1))
    when /со статьей "(.+)"/
      article_path(Article.find_by_title($1))
    when /отменить публикацию статьи "(.+)"/
      unpublish_article_path(Article.find_by_title($1))
    when /Добавить новый снипет/
      '/snippets/new'
    when /Просмотр снипета/
      /\/snippets\/\d+/
    when /Выбрать тему (.+)/
      /\/theme\/switch_to\?theme\=(.+)/
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
