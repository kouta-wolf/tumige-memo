require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'ユーザーが新規登録に成功すること' do
    visit new_user_path
    fill_in "名前", with: "テスト太郎"
    fill_in "メールアドレス", with: "sample@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード(確認)", with: "password"
    click_button "登録"

    expect(page).to have_content "ユーザー登録に成功しました"
    expect(current_path).to eq root_path
  end
end
