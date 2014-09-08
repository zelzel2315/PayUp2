class UserBet < ActiveRecord::Base

  belongs_to :bet
  belongs_to :user
  
  accepts_nested_attributes_for :bet

end
  