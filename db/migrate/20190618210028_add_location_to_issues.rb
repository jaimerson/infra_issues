class AddLocationToIssues < ActiveRecord::Migration[5.2]
  def change
    change_table :issues do |t|
      t.integer :location_id, null: false, default: 1
    end
  end
end
