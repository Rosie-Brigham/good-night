class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.night = Night.new(starttime: Time.now)
    @user.save
    session[:user] = @user.id
    redirect_to drinks_path
  end

  # def show
  #   redirect_to drinks_path
  # end

  def index
    @user = User.new
    session[:user] = @user
  end

  private

  def user_params
    params.require(:user).permit(:age, :weight, :gender)
  end

end
