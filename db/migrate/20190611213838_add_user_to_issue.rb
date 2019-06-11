class AddUserToIssue < ActiveRecord::Migration[5.2]
  def change
    change_table :issues do |t|
      t.integer :reported_by
    end
  end
end
