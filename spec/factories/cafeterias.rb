FactoryBot.define do
  factory :cafeteria do
    name                    {"子ども食堂"}
    image                   {"aaa.png"}
    addres                  {"横浜市"}
    detail                  {"おいしかったです！"}
    user_id                 {1}
    user
  end
end