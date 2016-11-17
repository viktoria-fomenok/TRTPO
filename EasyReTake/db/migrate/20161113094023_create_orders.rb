class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :type
      t.string :subject
      t.string :fio_professor
      t.string :position_professor
      t.string :reason
      t.datetime :data

      t.timestamps
    end
  end
end
