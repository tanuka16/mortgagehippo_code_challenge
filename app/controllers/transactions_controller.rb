class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def user_deposit
    #check by coin name, if possible make new deposit and increase the count of the amount.
    @coin = Coin.find(params[:coin_name])
    if @coin.blank?
      render json: {
        error: "Sorry, this coin is unavailable.",
        status: 400}
    else
      @deposit = Transaction.create(transaction_type: "Deposit", coin_name: params[:coin_name], user_id: user.id)
      @coin.increment!(:amount)
      if @deposit.save
        render json: @deposit
      else
        render json: {error: "Try again"}
      end
    end
  end
# check for available coin, if it more than 0 withdrawal transaction takes place.
  def user_withdrawal
    @coin = Coin.find(params[:coin_name])
    if @coin.blank?
      render json: {error: "Sorry, this coin is unavailable.",
      status: 400}
    elsif @coin.amount <= 0
      render json: {error: "Sorry, not enough amount for withdrawal",
      status: 400}
    else
      @withdrawal = Transaction.create(transaction_type: "Withdrawal", coin_name: params[:coin_name], user_id: user.id)
      @coin.decrement(:amount)
      @withdrawal.save
      render json: @withdrawal
    end
    # emails an alert if the amount of the coin is less than 4
    if @coin.amount < 4
      AdminAlert.coin_required(@coin).deliver
    end

  end

  def user_trans
    @transactions = Transaction.find(params[:user_id])
    if @transactions
      render json: @transactions
    else
      render json: {error: "No transaction was found for this user.",
      status: 400}
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :coin_name, :user_id)

  end


end
