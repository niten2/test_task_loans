class AddAndRemovePhone < ActiveRecord::Migration
  def change
    remove_column :users, :phone
    add_column :users, :phone, :integer
    remove_column :clients, :phone
    add_column :clients, :phone, :integer
    remove_column :clients, :passport
    add_column :clients, :passport, :integer
  end
end
