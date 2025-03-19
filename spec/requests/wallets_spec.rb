require 'rails_helper'

RSpec.describe "Wallets", type: :request do
  describe "GET /connect" do
    it "returns http success" do
      get "/wallets/connect"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /disconnect" do
    it "returns http success" do
      get "/wallets/disconnect"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /verify" do
    it "returns http success" do
      get "/wallets/verify"
      expect(response).to have_http_status(:success)
    end
  end

end
