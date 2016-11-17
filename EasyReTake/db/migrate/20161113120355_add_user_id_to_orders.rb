class AddUserIdToOrders < ActiveRecord::Migration[5.0]
  def self.up
    change_table :orders do |t|
      t.references :user, foreign_key: true
    end
  end

  def self.down
    remove_references :orders, :user
  end
end
