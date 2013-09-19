class PagesController < ApplicationController

  def index
		@banner = Banner.where(:banner_type => 'big_banner').first(:offset => rand(Banner.where(:banner_type => 'big_banner').count))
  end

  def test
  end
end
