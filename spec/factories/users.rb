FactoryBot.define do
  factory :user do
    username              {"テスト"}
    email                 {"aaa@gmail.com"}
    password              {"password"}
    password_confirmation {"password"}
  end
end