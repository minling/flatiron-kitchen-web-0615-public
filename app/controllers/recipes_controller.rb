class RecipesController < ApplicationController
before_action :set_recipes, only: [:show, :edit, :update, :destroy]
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    params[:id] = @recipe.id
    redirect_to recipe_path(params[:id])
  end

  def show
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(params[:id])
  end

  private
    def set_recipes
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [])
    end
end
