class BusquedaController < ApplicationController
    require 'net/http'
    require 'json'

    def buscar
      @query = params[:query]

      if @query
        query = CGI.escape(@query)
      end

      # Intenta obtener los resultados de la caché
      @resultados = Rails.cache.fetch("search_results_#{query}", expires_in: 1.hour) do
        api_url = "https://www.themealdb.com/api/json/v1/1/search.php?s=#{query}"
        response = Net::HTTP.get(URI(api_url))

        unless response.empty?
          data = JSON.parse(response)
          data['meals'] || []  # Estos son los resultados que se almacenarán en caché
        else
          @resultados = ""
        end
      end
    end
  end
