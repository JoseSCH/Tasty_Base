require 'rails_helper'

RSpec.describe "MiLista", type: :request do
  describe "GET /lista" do
    it "returns http success" do
      get "/mi_lista/lista"
      expect(response).to have_http_status(:success)
    end
  end

end
