class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.night = Night.new(starttime: Time.now)
    @user.save
    session[:user] = @user.id
    session[:weight] = @user.weight
    session[:gender] = @user.gender
    session[:targettime] = @user.targettime.to_i
    session[:yo] = @user.email

    cookies[:weight] = @user.weight.to_json
    cookies[:gender] = @user.gender.to_json
    cookies[:targettime] = @user.targettime.to_i.to_json
    cookies[:yo] = @user.email
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
    params.require(:user).permit(:age, :weight, :gender, :targettime, :email)
  end

end
