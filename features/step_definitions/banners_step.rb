# encoding: utf-8

Допустим /^существует баннер "(.*?)"$/ do |title|
	banner = FactoryGirl.create(:banner, :title => title)
end

Допустим /^существует баннер "(.*?)" с$/ do |title, table|
	banner = FactoryGirl.build(:banner, :title => title)
	table.rows_hash.each do |row|
		banner.update_attribute row[0].to_sym, row[1]
	end
	assert banner.save
end

Допустим /^существует отключенный баннер "(.*?)"$/ do |title|
	article = FactoryGirl.create(:banner, :title => title, :disabled => true)
end

То /^баннер "(.*?)" должен иметь следующие аттрибуты:$/ do |title, table|
  banner = Banner.find_by_title title
	table.hashes.each do |row|
		row[1] = row[1] == "true" if ["true", "false"].include? row[1] 
		assert_equal banner.attributes[row[0]], row[1]
	end
end
