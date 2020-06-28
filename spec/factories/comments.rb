FactoryBot.define do
  factory :comment do
    text { "コメント" }
    user
    cafeteria
  end
end