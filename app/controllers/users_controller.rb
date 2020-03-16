class UsersController < ApplicationController
  protect_from_forgery
  def create
    @user = User.create()
    render json: @user

  end
end
