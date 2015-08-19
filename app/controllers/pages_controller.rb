class PagesController < ApplicationController

  def index
		@banner = Banner.where(:banner_type => 'big_banner').first(:offset => rand(Banner.where(:banner_type => 'big_banner').count))
    @article = Article.find_by_url("index")
  end

  def test
  end

  def about_maximum_staff
  end

end
