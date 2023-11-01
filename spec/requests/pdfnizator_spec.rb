require 'rails_helper'

RSpec.describe "Pdfnizators", type: :request do
  describe "GET /plantilla" do
    it "returns http success" do
      get "/pdfnizator/plantilla"
      expect(response).to have_http_status(:success)
    end
  end

end
