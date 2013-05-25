class Banner < ActiveRecord::Base
  attr_accessible :content, :published, :target_url, :title
end
