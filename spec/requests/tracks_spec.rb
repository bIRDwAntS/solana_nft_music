require 'rails_helper'

RSpec.describe "Tracks", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/tracks/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/tracks/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/tracks/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/tracks/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/tracks/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /mint" do
    it "returns http success" do
      get "/tracks/mint"
      expect(response).to have_http_status(:success)
    end
  end

end
