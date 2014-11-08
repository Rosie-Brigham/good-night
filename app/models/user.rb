class User < ActiveRecord::Base
  has_one :night
  has_many :drinks, through: :nights
  has_many :drinks

  # before_save :create_night_session

  # def create_night_session
  #   self.night = Night.new
  # end
end
