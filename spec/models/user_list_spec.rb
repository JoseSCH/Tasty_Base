require 'rails_helper'

RSpec.describe UserList, type: :model do
  it "Receta con atributos validos" do
    User.create(email: "rodrick@lol.ni", password: "12345678")
    expect(UserList.new(recipe_name: "Pizza", imgPreview: "imagen", user_id: "1")).to be_valid
  end

  it "La receta no debe estar vacia" do
    User.create(email: "rodrick@lol.ni", password: "12345678")
    expect(UserList.new(recipe_name: nil, imgPreview: nil, user_id: nil)).to_not be_valid
  end

  it "pueden haber 2 recetas para el mismo usuario" do
    User.create(email: "rodrick@lol.ni", password: "12345678")
    UserList.create(recipe_name: "Pizza", imgPreview: "imagen", user_id: "1")
    expect(UserList.create(recipe_name: "Nacatamal", imgPreview: "imagen", user_id: "1")).to be_valid
  end
end
