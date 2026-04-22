require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  describe "正常系" do
    let(:user) { create(:user) }

    it '正しい情報であればログイン後トップページに遷移すること' do
      visit login_path

      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"

      expect(page).to have_content "ログインしました"
      expect(current_path).to eq root_path
    end
  end

  describe '異常系' do

  end
end
