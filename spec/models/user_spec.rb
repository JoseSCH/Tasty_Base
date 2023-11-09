require 'rails_helper'

RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers

  correo = Rails.application.config.email_for_testing
  contra = Rails.application.config.password_for_testing
  contra_fake = Rails.application.config.password_for_testing_fake

  it "usuario con atributos validos" do
    expect(User.new(email: correo, password: contra)).to be_valid
  end

  it "usuario con atributos no validos" do
    expect(User.new(email: "Joseloepintado", password: "123")).to be_invalid
  end

  it "No pueden haber usuarios duplicados" do
    User.create(email: correo, password: contra)
    expect(User.new(email: correo, password: contra_fake)).to be_invalid
  end

  it "Puede el usuario eliminar la cuenta?" do
    usuario = User.create(email: correo, password: contra)
    usuario.delete
    expect(usuario).to be_destroyed
  end
end
