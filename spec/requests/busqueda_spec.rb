require 'rails_helper'

RSpec.describe "Busquedas", type: :request do
  it "Verificar el acceso a la pagina de busquedas" do
    stub_request(:any, /.*/).to_return(status: 200)
    get buscar_path(query: "Arrabiata")
    expect(response).to have_http_status(:success)
  end
end
