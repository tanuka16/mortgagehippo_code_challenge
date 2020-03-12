class CoinsController < ApplicationController
  # View all Coins
  def index
    @coins = Coin.all
    render json: @coins
  end
  # View a single Coin
  def show
    @coin = Coin.find_by(:id => params[:id])
    render json: @coin
  end

  def new
    @coin = Coin.new
  end

  # Create a New Coin
  def create
    @coin = Coin.create(coin_params)
  end

# Update Attributes on an existing Coin
  def update
    @coin = Coin.find(params[:id])
    @coin.update(coin_params)
    render json: @coin
  end
  # Delete a Coin from the System
  def destroy
    @coin = Coin.find(params[:id])
    @coin.destroy
  end

  # private
  #
  # def coin_params
  #   params.require(:coin).permit(:id, :name, :value)
  #
  # end
end

# Get the total Value of all Coins in the system at a given time
