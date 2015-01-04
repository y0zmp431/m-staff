# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :banner do
    target_url "MyString"
    title "MyString"
    content "MyText"
    disabled "false" 
  end
end
