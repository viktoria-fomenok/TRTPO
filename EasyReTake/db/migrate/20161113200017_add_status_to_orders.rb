class AddStatusToOrders < ActiveRecord::Migration[5.0]
  def change
  	change_table :orders do |t|
  		t.boolean :status, :default => false
  	end
  end
end
