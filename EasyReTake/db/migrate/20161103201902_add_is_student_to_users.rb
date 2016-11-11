class AddIsStudentToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.boolean :is_student
  	end
  end
end
