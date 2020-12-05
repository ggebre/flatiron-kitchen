class RecipesController < ApplicationController
    def index 
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new

    end
    def show 
        @recipe = set_recipe 
        
    end
    def edit 
        @recipe = set_recipe 

    end
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save 
            redirect_to recipe_path(@recipe)
        end
    end

    def update 
        @recipe = set_recipe
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    private 
    def set_recipe 
         Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
