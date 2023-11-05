require 'rails_helper'

RSpec.describe "MiLista", type: :request do
  include Devise::Test::IntegrationHelpers

  correo = Rails.application.config.email_for_testing
  contra = Rails.application.config.password_for_testing

  it "Verificar el acceso a la pagina de lista del usuario" do
    usuario = User.create(email: correo, password: contra)
    sign_in usuario
    get mi_lista_path
    expect(response).to have_http_status(:success)
  end
end
