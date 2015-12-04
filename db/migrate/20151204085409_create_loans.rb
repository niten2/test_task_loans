class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :sum
      t.integer :total_sum
      t.datetime :end_loan

      t.timestamps null: false
    end
  end
end
