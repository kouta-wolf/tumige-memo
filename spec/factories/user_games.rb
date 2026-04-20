FactoryBot.define do
  factory :user_game do
    association :user
    association :game
    status { :not_played }
    score { 0 }
  end
end
