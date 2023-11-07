class AleatorioController < ApplicationController
    require 'net/http'
    require 'json'
    def recetas_aleatorias
      # Genera 10 IDs de recetas aleatorias en el rango especificado
      random_ids = (52764..52999).to_a.sample(5)

      # Realiza solicitudes a la API para obtener los detalles de las recetas aleatorias
      @recetas_aleatorias = []
      random_ids.each do |recipe_id|
        api_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{recipe_id}"
        response = Net::HTTP.get(URI(api_url))

        unless response.empty?
          data = JSON.parse(response)
          @recetas_aleatorias << data['meals'].first if data['meals'].present?
        else
          break
        end
      end
    end
end
