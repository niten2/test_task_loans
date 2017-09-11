class AddMarkRemovalClient < ActiveRecord::Migration
  def change
    add_column :clients, :mark_removal, :boolean, default: false
  end
end
