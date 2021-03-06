class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].nil? || params[:search].empty?
      @cocktails = Cocktail.all
    else
      @cocktails = Cocktail.where(name: params[:search])
    end
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    # Create restaurant
    @cocktail = Cocktail.new(cocktail_params)
    # redirect to the index of restaurants
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    # Filtering/Whitelisting the params that come in from the form
    params.require(:cocktail).permit(:name, photos: [])
  end

end
