require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  it "Verificar titulo dinamico" do
    expect(helper.tituloPagina("Recetas")).to eq "Tasty Base | Recetas"
  end
end
