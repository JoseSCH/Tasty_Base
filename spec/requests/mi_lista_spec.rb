require 'rails_helper'

RSpec.describe "MiLista", type: :request do
  include Devise::Test::IntegrationHelpers

  it "Verificar el acceso a la pagina de lista del usuario" do
    usuario = User.create(email: "rodrick@lol.ni", password: "12345678")
    sign_in usuario
    get mi_lista_path
    expect(response).to have_http_status(:success)
  end
end
