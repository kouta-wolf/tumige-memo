FactoryBot.define do
  factory :review do
    user_game { nil }
    content { "MyText" }
  end
end
