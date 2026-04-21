require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '正常系' do
    it 'タイトル、販売元、リリース日が正常であれば有効であること' do
      game = build(:game)
      expect(game).to be_valid
    end
  end

  describe '異常系' do
    it 'タイトルが無い場合は無効であること' do
      game = build(:game, title: nil)
      game.valid?
      expect(game.errors[:title]).to include(I18n.t('errors.messages.blank'))
    end

    it 'タイトルが重複する場合は無効であること' do
      game = create(:game, title: "SAME-man")
      game2 = build(:game, title: "SAME-man")
      game2.valid?
      expect(game2.errors[:title]).to include(I18n.t('errors.messages.taken'))
    end
  end

  describe 'アソシエーションのテスト' do
    let(:game) { create(:game) }
    let(:user1) { create(:user, name: "テスト太郎") }
    let(:user2) { create(:user, name: "テスト次郎") }

    it '複数のユーザーに所有されていること（throughの確認）' do
      create(:user_game, user: user1, game: game)
      create(:user_game, user: user2, game: game)
      expect(game.users).to include(user1, user2)
      expect(game.users.count).to eq 2
    end

    it 'ゲームを削除すると、紐づいているUserGameも削除されること' do
      create(:user_game, user: user1, game: game)
      expect { game.destroy }.to change(UserGame, :count).by(-1)
    end
  end
end
