require 'rails_helper'

RSpec.describe "Aleatorios", type: :request do
  it "Verificar el acceso a la pagina de recetas aleatorias" do
    stub_request(:any, /.*/).to_return(status: 200)
    get aleatorias_path
    expect(response).to have_http_status(:success)
  end
end
