# encoding: utf-8
#
То /^у статьи должны быть тэги "(.*?)"$/ do |tags|
  tag_list = Article.last.tag_list
  assert tag_list, tags#, "Tag_list of article:[#{tag_list}], but tags: [#{tags}]" 
  # express the regexp above with the code you wish you had
end

#Если /^у статьи должны быть тэги "(.*?)"$/ do |tags|
#  tag_list = Article.last.tag_list
#  assert tag_list, tags, "Tag_list of article:[#{tag_list}], but tags: [#{tags}]" 
#end

То /^облако тэгов должно содержать "(.*?)"$/ do |tags|
  tag_list = Article.tag_counts_on(:tags)
  assert tag_list, tags#, "Tag_list of article:[#{tag_list}], but tags: [#{tags}]" 
end
