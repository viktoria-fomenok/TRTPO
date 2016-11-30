class AddDataexamToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :data_exam, :string
  end
end
