class Bet < ActiveRecord::Base

  # belongs_to :beter, class_name: "User", foreign_key: :user_id, inverse_of: :beters

  # belongs_to :betee, class_name: "User", foreign_key: :betee_id, inverse_of: :betees

  has_many :user_bets
  has_many :users, through: :user_bets

end
