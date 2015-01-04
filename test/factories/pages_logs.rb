# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pages_log do
    session_id 1
    user_id 1
    date_open "2013-03-06 11:33:55"
    date_close "2013-03-06 11:33:55"
    current_page "MyText"
    refferer_page "MyText"
  end
end
