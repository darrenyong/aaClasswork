class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user][:email])
    redirect_to 
  end

end
