require 'rails_helper'

RSpec.describe "Api::Cores", type: :request do
  describe "GET /information" do
    it "returns http success" do
      get "/api/core/information"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /status" do
    it "returns http success" do
      get "/api/core/status"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /features" do
    it "returns http success" do
      get "/api/core/features"
      expect(response).to have_http_status(:success)
    end
  end

end
