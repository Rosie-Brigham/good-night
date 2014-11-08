class DrinksController < ApplicationController


  def drinks
    @user = find_user
  end

  def index
    @user = find_user
    @drinks = Drink.all
  end

  def calculate
    @user
    @calories = find_calories(params[:drinks])
    @time = find_time(params[:drinks])

    redirect_to results_path
  end

  def result
    @user
    @calories
    @time
  end



  private

  def find_user
        # require'pry';binding.pry

    User.where(id: session[:user]).first
  end

  def find_calories
    calories = 0
    @user.drinks.each do |drinks|
      calories = calories + drink.calories
    end
    @calories = calories
  end

  def find_time

  end

end
