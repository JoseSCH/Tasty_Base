class MostrarDetallesController < ApplicationController
  require 'net/http'

  def detalles
    #Obtener la receta de la cual se quiere mostrar los detalles mediante el ID.

    id = params[:id]
    #Construir la URL.
    api_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"

    # Realiza la solicitud a la API
    response = Net::HTTP.get(URI(api_url))

    # Convierte la respuesta JSON en un objeto Ruby
    @recipe = JSON.parse(response)['meals']
  end
end
