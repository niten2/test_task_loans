class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :territory
      t.string :phone
      t.string :email
      t.string :passport

      t.timestamps null: false
    end
  end
end
