class Night < ActiveRecord::Base
  has_many :drinks
  belongs_to :user
end
