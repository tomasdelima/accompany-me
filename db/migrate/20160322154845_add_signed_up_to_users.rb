class AddSignedUpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :signed_up, :boolean
  end
end
