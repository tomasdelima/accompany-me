class AddContactToFriendship < ActiveRecord::Migration
  def change
    add_reference :friendships, :contact, index: true
  end
end
