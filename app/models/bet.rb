class Bet < ActiveRecord::Base
<<<<<<< HEAD
	# include Workflow
	# workflow do
	# 	state :new do
	#  		event :submit, :transitions_to => :pending
 #    end
 #    state :pending do
 #      event :accept, :transitions_to => :accepted
 #      event :reject, :transitions_to => :rejected
 #    end
 #    state :accepted
 #    state :rejected
 #  end
=======
	include Workflow
	workflow do
    state :pending do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :accepted
    state :rejected
  end
>>>>>>> a125ca07dae9ba98729c6596a6e2a3446f2185c2

  # belongs_to :beter, class_name: "User", foreign_key: :user_id, inverse_of: :beters

  # belongs_to :betee, class_name: "User", foreign_key: :betee_id, inverse_of: :betees

  has_many :user_bets
  has_many :users, through: :user_bets, :foreign_key => :user_id

  accepts_nested_attributes_for :users
end 
