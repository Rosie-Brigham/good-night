class DrinksController < ApplicationController

  def drinks
    @user = find_user
  end

  def index
    @user = find_user
    @drinks = Drink.all
    @night
  end

  def calculate
    @user
    @calories = find_calories(params[:drinks])
    @time = find_time(params[:drinks])
    @drink_total = find_total(params[:drinks])

    response = { time: @time, calories: @calories, drink_total: @drink_total}
    render json: outcome.result
  end

  def result
    @user
    @calories
    @time
    response = { pending_rewards: check_pending_rewards, redeemable_rewards: calculate_redeemable_amount, redeemed_all_rewards: check_redeemed_rewards}
    render json: outcome.result
  end

  private

  def find_time_to_metabolise
    find_alcohol_in_blood / 0.016
  end

  def find_alcohol_in_blood
    (desnity_of_ethanol * alcohol_consumed) / (@user.weight * distribution_ratio * 1000)
  end

  def density_of_ethanol
    80
  end

  def alcohol_consumed
    @user.units * 10
  end

  def distribution_ratio
    if @user.gender == m
      0.68
    elsif @user.gender = f
      0.55
    else
      0.6
    end
  end

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
