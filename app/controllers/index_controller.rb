class IndexController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    #Construir la URL.
    api_url = "https://www.themealdb.com/api/json/v1/1/random.php"

    # Realiza la solicitud a la API
    response = Net::HTTP.get(URI(api_url))

    # Convierte la respuesta JSON en un objeto Ruby
    @recipe = JSON.parse(response)['meals']
  end
end
