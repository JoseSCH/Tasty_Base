require 'rails_helper'

RSpec.describe "Estado de actividad", type: :request do
  describe "-> obtener la ruta del estado de actividad" do
    it "Debe de responder como: succes" do
      get rails_health_check_path
      expect(response).to have_http_status(:success)
    end
  end
end
