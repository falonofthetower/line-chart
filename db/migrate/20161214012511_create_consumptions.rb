class CreateConsumptions < ActiveRecord::Migration[5.0]
  def change
    create_table :consumptions do |t|
      t.integer :sunday, default: 0
      t.integer :monday, default: 0
      t.integer :tuesday, default: 0
      t.integer :wednesday, default: 0
      t.integer :thursday, default: 0
      t.integer :friday, default: 0
      t.integer :saturday, default: 0
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
