class AddColumnToBet < ActiveRecord::Migration
  def change
    add_column :bets, :challenger, :string
    add_column :bets, :challengee, :string
  end
end
