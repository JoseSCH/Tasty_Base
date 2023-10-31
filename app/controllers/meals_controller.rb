class MealsController < ApplicationController
  require 'net/http'
  require 'json'

  def categories
    # Usa la caché para almacenar/recuperar los resultados
    @recipes_by_category = Rails.cache.fetch('recipes_by_category', expires_in: 1.hour) do
      categories = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
      result = {}

      categories.each do |category|
        # Construye la URL de la API para obtener recetas por categoría
        api_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"

        # Realiza la solicitud a la API
        response = Net::HTTP.get(URI(api_url))

        # Convierte la respuesta JSON en un objeto Ruby
        recipes = JSON.parse(response)['meals']

        # Limita la cantidad de recetas a un máximo de 4
        result[category] = recipes.take(4)
      end

      result
    end
  end

  def recipes_by_category
    category = params[:category]
    # Usa la caché para almacenar/recuperar los resultados
    @recipes = Rails.cache.fetch("recipes_by_category_#{category}", expires_in: 1.hour) do
      # Construye la URL de la API para obtener recetas por categoría
      api_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"

      # Realiza la solicitud a la API
      response = Net::HTTP.get(URI(api_url))

      # Convierte la respuesta JSON en un objeto Ruby
      JSON.parse(response)['meals']
    end
  end
end
