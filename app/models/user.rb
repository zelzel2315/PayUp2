class User < ActiveRecord::Base

	# has_many :beters, class_name: "Bet", foreign_key: :user_id, inverse_of: :beter

 #  has_many :betees, class_name: "Bet", foreign_key: :betee_id, inverse_of: :betee

 	has_many :user_bets
 	has_many :bets, through: :user_bets

end
 