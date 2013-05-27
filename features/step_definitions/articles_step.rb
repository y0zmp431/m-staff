# encoding: utf-8

Допустим /^существует статья "(.*?)"$/ do |title|

	article = FactoryGirl.create(:article, :title => title)
end

Допустим /^существует неопубликованная статья "(.*?)"$/ do |title|

	article = FactoryGirl.create(:article, :title => title, :published => false)
end

Допустим /^существует статья "(.*?)" c:$/ do |title, table|
	article = FactoryGirl.build(:article, :title => title)
	table.rows_hash.each do |row|
		article.update_attribute row[0].to_sym, row[1]
	end
	@writer = User.find_by_login("writer") || FactoryGirl.create(:writer) 
	article.user = @writer
	assert article.save
end

Если /^я вижу ссылку на статью "(.*?)"$/ do |title|
	  article = Article.find_by_title(title)
		page.should have_selector("a[href='#{article_path article}']")
end

Если /^я создаю статью указывая след\. данные:$/ do |table|
  step %{я на странице Новая статья}

	table.rows_hash.each do |row|
		step %{я ввожу в поле "#{row[0]}" значение "#{row[1]}"}
	end
	step %{кликаю кнопку "Сохранить"}
end

То /^я должен перейти к просмотру статьи "(.*?)"$/ do |title|
		article = Article.find_by_title(title);
    assert_equal article_path(article), current_path
end

То /^увидеть заголовок "(.*?)"$/ do |head_text|
		page.html.should match "<h1>#{head_text}</h1>"
end

То /^я должен увидеть ссылку для редактирования статьи "(.*?)"$/ do |title|
		page.should have_selector("a[href='#{edit_article_path Article.find_by_title title}']")
end

То /^не должно быть ссылки для редактирования статьи "(.*?)"$/ do |title|
		page.should have_no_selector("a[href='#{edit_article_path Article.find_by_title title}']")
end

То /^я должен увидеть ссылку для отмены публикации статьи "(.*?)"$/ do |title|
		page.should have_selector("a[href='#{unpublish_article_path Article.find_by_title title}']")
end

То /^не должно быть ссылки для отмены публикации статьи "(.*?)"$/ do |title|
		page.should have_no_selector("a[href='#{unpublish_article_path Article.find_by_title title}']")
end


То /^статья "(.*?)" должна иметь следующие аттрибуты:$/ do |title, table|
  article = Article.find_by_title title
	table.hashes.each do |row|
		row[1] = row[1] == "true" if ["true", "false"].include? row[1] 
		assert_equal article.attributes[row[0]], row[1]
	end
end

То /^в списке статей не должно быть ссылки на статью "(.*?)"$/ do |title|
	@article = Article.find_by_title title
		page.find('table').should have_no_selector("a[href='#{article_path @article}']")
end
