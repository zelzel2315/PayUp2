class DropCreateVenmos < ActiveRecord::Migration
  def up
    drop_table :create_venmos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
