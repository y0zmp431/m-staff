# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dog do
    url "MyString"
    name "MyString"
    fullname "MyString"
    male false
    for_sale false
    for_love false
    from_us false
    date_of_birth "2013-08-21 23:30:33"
    desc "MyText"
    pedigree "MyString"
    disabled false
    owner_desc "MyText"
  end
end
