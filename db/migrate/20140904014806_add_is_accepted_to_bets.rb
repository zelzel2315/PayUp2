class AddIsAcceptedToBets < ActiveRecord::Migration
  def change
    add_column :bets, :is_accepted, :boolean
  end
end
