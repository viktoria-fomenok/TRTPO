class AddStringToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :students_ids, :string, default: ""
  end
end
