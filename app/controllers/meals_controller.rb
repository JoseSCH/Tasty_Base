class MealsController < ApplicationController
  require 'net/http'
  require 'json'

  def categories
    # Construye la URL de la API para obtener recetas por categoría
    api_url = "https://www.themealdb.com/api/json/v1/1/categories.php"

    # Realiza la solicitud a la API
    response = Net::HTTP.get(URI(api_url))

    # Convierte la respuesta JSON en un objeto Ruby
    @categorias = JSON.parse(response)['categories']
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

      # Convierte la respuesta JSON en un objeto Ruby
      JSON.parse(response)['meals']
    end
  end
end
