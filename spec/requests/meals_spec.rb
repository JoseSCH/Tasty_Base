require 'rails_helper'

RSpec.describe "Meals", type: :request do
  it "Verificar el acceso a la pagina de categorias" do
    stub_request(:any, /.*/).to_return(status: 200)
    get categories_meals_path
    expect(response).to have_http_status(:success)
  end

  it "Verificar el acceso a las recetas de esa categoria" do
    stub_request(:any, /.*/).to_return(status: 200)
    get recipes_by_category_meals_path(category: "Dessert")
    expect(response).to have_http_status(:success)
  end
end
