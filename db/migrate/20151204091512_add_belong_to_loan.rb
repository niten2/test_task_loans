class AddBelongToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :client_id, :integer
  end
end
