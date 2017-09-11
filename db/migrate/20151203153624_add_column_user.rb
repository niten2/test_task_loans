class AddColumnUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :patronymic, :string
    add_column :users, :territory, :string
    add_column :users, :phone, :string
  end
end
