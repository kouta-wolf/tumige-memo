FactoryBot.define do
  factory :user do
    name { "テスト太郎" }
    email { "text@example.com" }
    password { "password" }
  end
end
