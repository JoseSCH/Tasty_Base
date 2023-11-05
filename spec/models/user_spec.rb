require 'rails_helper'

RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers

  it "usuario con atributos validos" do
    expect(User.new(email: "rodrick@lol.ni", password: "12345678")).to be_valid
  end

  it "usuario con atributos no validos" do
    expect(User.new(email: "Joseloepintado", password: "123")).to be_invalid
  end

  it "No pueden haber usuarios duplicados" do
    User.create(email: "rodrick@lol.ni", password: "12345678")
    expect(User.new(email: "rodrick@lol.ni", password: "87654321")).to be_invalid
  end

  it "Puede el usuario eliminar la cuenta?" do
    usuario = User.create(email: "rodrick@lol.ni", password: "12345678")
    usuario.delete
    expect(usuario).to be_destroyed
  end
end
