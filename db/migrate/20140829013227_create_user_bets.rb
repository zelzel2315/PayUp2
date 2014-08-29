class CreateUserBets < ActiveRecord::Migration
  def change
    create_table :user_bets do |t|
      t.references :bet, index: true
      t.references :user, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
