require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "新規登録の画面に遷移できること" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end
end
