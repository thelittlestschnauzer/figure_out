class RecipesController < ApplicationController
  before_action :require_login

  def new
    @recipe = current_user.recipes.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
      redirect_to recipes_path
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  def index
    @recipes = Recipe.order(:id)
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe Updated!'
    else
      @errors = @recipe.errors.full_messages
      render :edit
    end
  end 


  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Deleted Recipe #{recipe.title}'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end

end
