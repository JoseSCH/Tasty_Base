class MostrarDetallesController < ApplicationController
  require 'net/http'

  def detalles
    #Obtener la receta de la cual se quiere mostrar los detalles mediante el ID.

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
    end

    #Verifica si el cliente ha agregado esa receta a su lista.
    if signed_in?
      @existe = UserList.exists?(user_id: current_user.id, idMeal: id)
    end
  end
end
