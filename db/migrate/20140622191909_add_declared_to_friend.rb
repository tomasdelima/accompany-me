class AddDeclaredToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :declared, :boolean
  end
end
