class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def index
      @recipes = Recipe.all
    end
  
    def show
      # Aquí puedes mostrar los detalles de una receta individual
    end
  
    def search
        if params[:query].present?
          @query = params[:query]
          @results = MealDbService.search_by_name(@query)
        else
          @query = ''
          @results = []
        end
    end
    
    def new
      @recipe = Recipe.new
    end
  
    def create
      @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to @recipe, notice: 'Receta creada exitosamente.'
      else
        render :new
      end
    end
  
    def edit
      # Aquí puedes permitir la edición de una receta
    end
  
    def update
      if @recipe.update(recipe_params)
        redirect_to @recipe, notice: 'Receta actualizada exitosamente.'
      else
        render :edit
      end
    end
  
    def destroy
      @recipe.destroy
      redirect_to recipes_url, notice: 'Receta eliminada.'
    end
  
    private
  
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
  
    def recipe_params
      params.require(:recipe).permit(:name, :category, :instructions)
    end
end
