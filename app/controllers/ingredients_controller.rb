class IngredientsController < ApplicationController
  before_action :set_ingredients, only: [:show, :edit, :update, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    params[:id] = @ingredient.id
    redirect_to ingredient_path(params[:id])
  end

  def show
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(params[:id])
  end

  private
    def set_ingredients
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
