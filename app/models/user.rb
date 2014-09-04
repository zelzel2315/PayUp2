class User < ActiveRecord::Base

	# has_many :beters, class_name: "Bet", foreign_key: :user_id, inverse_of: :beter

 #  has_many :betees, class_name: "Bet", foreign_key: :betee_id, inverse_of: :betee

 	has_many :user_bets, :dependent => :destroy
 	has_many :bets, through: :user_bets, :foreign_key => :bet_id

 	accepts_nested_attributes_for :bets
end
 