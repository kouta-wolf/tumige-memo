require 'rails_helper'

RSpec.describe User, type: :model do
  describe "正常系" do
    it "名前、メール、パスワードがあれば有効であること" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe "異常系" do
    it "名前が無い場合は無効であること" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "重複したメールアドレスは登録できないこと" do
      user = create(:user, email: "same@example.com")
      user2 = build(:user, email: "same@example.com")
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")

    end

    it "メールアドレスが無い場合は無効であること" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "パスワードが無い場合は無効であること" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "パスワードが短い場合は無効であること" do
      user = build(:user, password: "1234")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "パスワードが長い場合は無効であること" do
      user = build(:user, password: "123456789abcdefghijkl")
      user.valid?
      expect(user.errors[:password]).to include("is too long (maximum is 20 characters)")
    end

    it "パスワードと確認用パスワードが一致しない場合は無効であること" do
      user = build(:user, password: "password", password_confirmation: "miss")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  describe 'アソシエーションのテスト' do
    let(:user) { create(:user) }
    let(:game1) { create(:game, title: "Game_1") }
    let(:game2) { create(:game, title: "Game_2") }

    it '複数のゲームを所有できること（throughの確認）' do
      create(:user_game, user: user, game: game1)
      create(:user_game, user: user, game: game2)
      expect(user.games).to include(game1, game2)
      expect(user.games.count).to eq 2
    end

    it 'ユーザーを削除すると紐づくUserGameを削除する（dependent: :destroyの確認)' do
      create(:user_game, user: user, game: game1)
      expect { user.destroy }.to change(UserGame, :count).by(-1)
    end

    it 'ユーザーを削除しても、Game自体は削除されないこと' do
      create(:user_game, user: user, game: game1)
      expect { user.destroy }.not_to change(Game, :count)
    end
  end
end
