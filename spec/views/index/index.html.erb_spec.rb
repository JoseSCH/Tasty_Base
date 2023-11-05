require 'rails_helper'

RSpec.describe "index/index.html.erb", type: :view do
  it "renderiza el titulo de la pagina." do
    assign(:recipe, {})

    render

    expect(rendered).to have_content("Bienvenido a Tasty Base!!!")
  end
end
