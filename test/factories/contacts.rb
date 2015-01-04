# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    main_phone ""
    phones ""
    email ""
    skype ""
    gtalk ""
    adress "MyText"
    desc "MyText"
  end
end
