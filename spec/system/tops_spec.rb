require 'rails_helper'

RSpec.describe "Tops", type: :system do
  describe "正常動作" do
    it "トップページが表示されること" do
      visit root_path
      expect(page).to have_content "積みゲーメモ"
    end
  end
end
