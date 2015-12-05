class AddAndRemoveTerritory < ActiveRecord::Migration
  def change
    remove_column :clients, :territory
    remove_column :users, :territory
    add_column :users, :territory, :integer
  end
end
