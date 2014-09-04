class AddUserBet1ToBets < ActiveRecord::Migration
  def change
    add_column :bets, :user_bet1, :string
  end
end
