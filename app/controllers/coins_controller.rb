class CoinsController < ApplicationController
  protect_from_forgery
  # View all Coins
  def index
    @coins = Coin.all
    render json: @coins, except: [:created_at, :updated_at]
  end

  # View a single Coin
  def show
    @coin = Coin.find_by(:id => params[:id])
    render json: @coin
  end

  # Create a New Coin
  def create
    @coin = Coin.new(coin_params)
    if @coin.save
      render json: @coin
    else
      render json: {errors: @coin.errors.full_messages}, status: 422
    end
  end

# Update Attributes on an existing Coin
  def update
    @coin = Coin.find_by(:id => params[:id])
    @coin.update(coin_params)
    render json: @coin
  end

  # Delete a Coin from the System
  def destroy
    @coin = Coin.find_by(:id => params[:id])
    if @coin.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def sum
    @sum = Coin.sum_value
    render json: @sum 
  end

  private

  def coin_params
    params.require(:coin).permit(:name, :value)
  end
end
