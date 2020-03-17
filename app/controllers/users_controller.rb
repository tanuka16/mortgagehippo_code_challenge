class UsersController < ApplicationController
  # protect_from_forgery
  def create
    @num = rand(10 ** 10)
    @user = User.create(api_key: @num)
    render json: @user
    
  end
end
