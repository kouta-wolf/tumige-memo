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
      expect(game.errors[:title]).to include("can't be blank")
    end

    it 'タイトルが重複する場合は無効であること' do
      game = create(:game, title: "SAME-man")
      game2 = build(:game, title: "SAME-man")
      game2.valid?
      expect(game2.errors[:title]).to include("has already been taken")
    end
  end
end
