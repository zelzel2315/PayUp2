class AddUserBet2ToBets < ActiveRecord::Migration
  def change
    add_column :bets, :user_bet2, :string
  end
end
