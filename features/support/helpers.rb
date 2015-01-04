def set_date(date, options = {})  
  raise ArgumentError, 'from is a required option' if options[:from].blank?
  date = date.to_date
  field = options[:from].to_s
  select date.year.to_s,               :from => "#{field}_1i"
  month = I18n.l(date, :format => "%d %b").split(" ")[1]
  select month, :from => "#{field}_2i"
  select date.day.to_s,                :from => "#{field}_3i"
end
