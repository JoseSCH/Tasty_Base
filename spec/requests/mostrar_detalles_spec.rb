require 'rails_helper'

RSpec.describe "MostrarDetalles", type: :request do
  describe "GET /detalles" do
    it "returns http success" do
      get "/mostrar_detalles/detalles"
      expect(response).to have_http_status(:success)
    end
  end

end
