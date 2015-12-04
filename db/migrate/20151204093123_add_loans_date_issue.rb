class AddLoansDateIssue < ActiveRecord::Migration
  def change
    add_column :loans, :date_issue, :datetime
  end
end
