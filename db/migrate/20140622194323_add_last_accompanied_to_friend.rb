class AddLastAccompaniedToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :last_accompanied, :date
  end
end
