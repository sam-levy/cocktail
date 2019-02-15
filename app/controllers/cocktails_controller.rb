class CocktailsController < ApplicationController
  def index
    @cocktail = Cocktail.new
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :index
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
