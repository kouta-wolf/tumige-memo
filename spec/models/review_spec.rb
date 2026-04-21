require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '正常系' do
    it 'ゲームに本文を保存できること' do
      review = build(:review)
      expect(review).to be_valid
    end
  end

  describe '異常系' do
    it 'UserGameが無いなら保存できないこと' do
      review = build(:review, user_game: nil)
      review.valid?
      expect(review.errors[:user_game]).to include(I18n.t('errors.messages.required'))
    end

    it '1つのUserGameに対して2つ以上のReviewを保存できないこと' do
      user_game = create(:user_game)
      create(:review, user_game: user_game)
      duplicate_review = build(:review, user_game: user_game)
      expect(duplicate_review).not_to be_valid
      expect(duplicate_review.errors[:user_game_id]).to include(I18n.t('errors.messages.taken'))
    end
  end

  describe 'アソシエーションチェック' do
    let(:user) { create(:user) }
    let(:user_game) { create(:user_game, user: user) }

    it 'UserからUserGame経由でReviewが取得できること' do
      review = create(:review, user_game: user_game)
      expect(user.reviews).to include(review)
    end

    it 'UserGameを消したらReviewも消えるか' do
      create(:review, user_game: user_game)
      expect { user_game.destroy }.to change(Review, :count).by(-1)
    end
  end
end
