require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  describe "正常系" do
    let(:user) { create(:user) }

    it '正しい情報であればログイン後gameページに遷移すること' do
      visit new_session_path

      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログインする"

      expect(page).to have_content "ログインしました"
      expect(current_path).to eq games_index_path
    end
  end
end
