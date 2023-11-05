module ApplicationHelper

  #Metodo para que cambien el nombre de la pagina en la pestaña.
  def tituloPagina(page_title = '')
    base_title = "Tasty Base"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end

end
