class PdfnizatorController < ApplicationController
  def receta
    #Obtener el ID de la receta.
    id = params[:id]

    #Construir la URL.
    api_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
    @ingredientesImg = "https://www.themealdb.com/images/ingredients/"

    # Realiza la solicitud a la API
    response = Net::HTTP.get(URI(api_url))

    if not response.empty?
      # Convierte la respuesta JSON en un objeto Ruby
      @recipe = JSON.parse(response)['meals']
    else
      @recipe = {}
      return
    end

    #Para colocar el nombre del pdf en el navegador.
    nombre = "error"

    if @recipe
      @recipe.each do |data|
        nombre = data["strMeal"]
      end
    end

    #Renderizar el pdf para su posterior descarga.
    render pdf: "#{nombre}",
      show_as_html: params[:debug].present?,
      disposition: 'attachment',
      background: true,
      disable_smart_shrinking: true,
      print_media_type: true,
      :encoding => 'UTF-8'
  end
end
