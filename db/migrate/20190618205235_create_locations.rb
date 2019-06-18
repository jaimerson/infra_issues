class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false, default: ''
      t.string :floor, null: false, default: 'outside'

      t.timestamps null: false
    end
  end
end
