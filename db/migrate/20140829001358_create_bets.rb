class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :challenge
      t.float :amount
      t.date :challenge_start
      t.date :challenge_end
      t.integer :winner_id
      # t.string :loser
      # t.references :UserBet, index: true

      t.timestamps 
    end
  end
end
