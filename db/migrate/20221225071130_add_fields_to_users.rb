class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :lastname, :string, null: false
    add_column :users, :plant, :string, null: false
    add_column :users, :department, :string, null: false
    add_column :users, :position, :string, null: false
    add_column :users, :admin, :boolean, default: false
  end
end
