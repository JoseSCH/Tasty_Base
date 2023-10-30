class MealsController < ApplicationController
  require 'net/http'
  require 'json'

  def categories
      categories = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
      @recipes_by_category = {}

      categories.each do |category|
        # Construye la URL de la API para obtener recetas por categoría
        api_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"

        # Realiza la solicitud a la API
        response = Net::HTTP.get(URI(api_url))

        # Convierte la respuesta JSON en un objeto Ruby
        recipes = JSON.parse(response)['meals']

        # Limita la cantidad de recetas a un máximo de 4
        @recipes_by_category[category] = recipes.take(4)
      end
    end

    def recipes_by_category
        category = params[:category]
        # Construye la URL de la API para obtener recetas por categoría
        api_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"

        # Realiza la solicitud a la API
        response = Net::HTTP.get(URI(api_url))

        # Convierte la respuesta JSON en un objeto Ruby
        @recipes = JSON.parse(response)['meals']
      end
end
