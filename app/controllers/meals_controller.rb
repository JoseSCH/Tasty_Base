class MealsController < ApplicationController
  require 'net/http'
  require 'json'

  def categories
    # Usa la caché para almacenar/recuperar los resultados
    @categorias = Rails.cache.fetch("Categorias", expires_in: 1.hour) do

      # Construye la URL de la API para obtener recetas por categoría
      api_url = "https://www.themealdb.com/api/json/v1/1/categories.php"

      # Realiza la solicitud a la API
      response = Net::HTTP.get(URI(api_url))

      if not response.empty?
        # Convierte la respuesta JSON en un objeto Ruby
        JSON.parse(response)['categories']
      else
        @categorias = ""
      end
    end
  end

  def recipes_by_category
    category = params[:category]
    # Usa la caché para almacenar/recuperar los resultados
    @recipes = Rails.cache.fetch("recipes_by_category_#{category}", expires_in: 1.hour) do
      # Construye la URL de la API para obtener recetas por categoría
      api_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
      @name = category

      # Realiza la solicitud a la API
      response = Net::HTTP.get(URI(api_url))

      if not response.empty?
        # Convierte la respuesta JSON en un objeto Ruby
        JSON.parse(response)['meals']
      else
        @recipes = ""
      end
    end
  end
end
