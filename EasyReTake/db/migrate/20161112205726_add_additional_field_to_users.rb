class AddAdditionalFieldToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
      t.string   :faculty
      t.integer :group
      t.integer  :course
    end
  end
end
