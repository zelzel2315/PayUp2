class CreateVenmos < ActiveRecord::Migration
  def change
    create_table :venmos do |t|
      t.string :username
      t.integer :made_bets

      t.timestamps
    end
  end
end
