class BusquedaController < ApplicationController
    require 'net/http' # Asegúrate de requerir la biblioteca Net::HTTP
    require 'json' 

    def buscar
        @query = params[:query]
        query = CGI.escape(@query)  # Utiliza CGI.escape para escapar la consulta
        api_url = "https://www.themealdb.com/api/json/v1/1/search.php?s=#{query}"
        response = Net::HTTP.get(URI(api_url))
        data = JSON.parse(response)
        @resultados = data['meals'] || []
    end
  end
  