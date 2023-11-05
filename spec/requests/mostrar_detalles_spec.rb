require 'rails_helper'

RSpec.describe "MostrarDetalles", type: :request do
  it "Verificar el acceso a la pagina de detalles de la receta" do
    stub_request(:any, /.*/).to_return(status: 200)
    get show_details_path
    expect(response).to have_http_status(:success)
  end
end
