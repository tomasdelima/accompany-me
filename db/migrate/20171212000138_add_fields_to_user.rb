class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :celphone, :string
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :observations, :text
    add_column :users, :birthdate, :date
    add_column :users, :age, :integer
    add_column :users, :age_changed_at, :date
  end
end
