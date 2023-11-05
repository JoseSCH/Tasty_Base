require 'rails_helper'

RSpec.describe "mostrar_detalles/detalles.html.erb", type: :view do
  it "renderiza el titulo de la pagina." do
    assign(:recipe, {})

    render template: "pdfnizator/receta", formats: :pdf

    expect(rendered).to have_content("Tasty Base")
  end
end
