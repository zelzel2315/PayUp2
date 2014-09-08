class AddWorkflowToBet < ActiveRecord::Migration
  def change
    add_column :bets, :workflow_state, :string
  end
end
