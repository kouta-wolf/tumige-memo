require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe '正常系' do
    it 'ユーザー、ゲーム、ステータス、スコアが正常であること' do
      user_game = build(:user_game)
      expect(user_game).to be_valid
    end
  end

  describe '異常系' do
    it 'ユーザーがない場合は無効であること' do
      user_game = build(:user_game, user: nil)
      user_game.valid?
      expect(user_game.errors[:user]).to include(I18n.t('errors.messages.required'))
    end

    it 'ゲームがない場合は無効であること' do
      user_game = build(:user_game, game: nil)
      user_game.valid?
      expect(user_game.errors[:game]).to include(I18n.t('errors.messages.required'))
    end

    it '同じユーザーとゲームの組み合わせは登録できないこと' do
      user_game = create(:user_game)
      user_game2 = build(
        :user_game,
        user: user_game.user,
        game: user_game.game
        )
      expect(user_game2).not_to be_valid
      expect(user_game2.errors[:user_id]).to include(I18n.t('errors.messages.taken'))
    end
  end
end
