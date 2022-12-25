class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :alias
      t.string :sap
      t.string :layout
      t.string :plant
      t.string :bu
      t.string :technology
      t.string :customer
      t.integer :volume
      t.integer :max
      t.integer :damaged
      t.integer :blocked
      t.integer :spares
      t.integer :active
      t.string :segment
      t.float :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
