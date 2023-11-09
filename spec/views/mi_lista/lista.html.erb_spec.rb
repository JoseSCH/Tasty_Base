require 'rails_helper'

RSpec.describe "mi_lista/lista.html.erb", type: :view do
  it "renderiza el titulo de la pagina." do
    assign(:user_list, {})

    render

    expect(rendered).to have_content("Esta algo desierto por estos lares...")
  end
end
