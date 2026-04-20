FactoryBot.define do
  factory :review do
    association :user_game
    sequence(:content) { |n| "Test Review Content #{n}" }
  end
end
