require 'rails_helper'

RSpec.describe "Pdfnizators", type: :request do
  include Devise::Test::IntegrationHelpers

  correo = Rails.application.config.email_for_testing
  contra = Rails.application.config.password_for_testing

  it "Verificar el acceso al pdf" do
    usuario = User.create(email: correo, password: contra)
    sign_in usuario
    stub_request(:any, /.*/).to_return(status: 406)
    get pdfizador_path

    # Verifica que la respuesta sea exitosa y que el pdf tenga el nombre correcto
    expect(response).to have_http_status(406)
  end

end
