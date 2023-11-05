require 'rails_helper'

RSpec.describe UserList, type: :model do
  correo = Rails.application.config.email_for_testing
  contra = Rails.application.config.password_for_testing

  it "Receta con atributos validos" do
    User.create(email: correo, password: contra)
    expect(UserList.new(recipe_name: "Pizza", imgPreview: "imagen", user_id: "1")).to be_valid
  end

  it "La receta no debe estar vacia" do
    User.create(email: correo, password: contra)
    expect(UserList.new(recipe_name: nil, imgPreview: nil, user_id: nil)).to_not be_valid
  end

  it "pueden haber 2 recetas para el mismo usuario" do
    User.create(email: correo, password: contra)
    UserList.create(recipe_name: "Pizza", imgPreview: "imagen", user_id: "1")
    expect(UserList.create(recipe_name: "Nacatamal", imgPreview: "imagen", user_id: "1")).to be_valid
  end
end
