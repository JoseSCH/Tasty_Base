require 'rails_helper'

RSpec.describe "Indices", type: :request do
    it "Verificar el acceso a la pagina de inicio" do
      stub_request(:any, /.*/).to_return(status: 200)
      get root_path
      expect(response).to have_http_status(:success)
    end
end
