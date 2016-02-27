class RemoveOldFields < ActiveRecord::Migration
  def up
    remove_column :activities, :organizer_id
    remove_column :activities, :user_id

    remove_column :accompaniments, :activity_id
    remove_column :accompaniments, :friend_id

    remove_column :experiences, :related_to_id
    remove_column :experiences, :related_to_type

    remove_column :learnings, :related_to_id
    remove_column :learnings, :related_to_type
    remove_column :learnings, :owner_id
  end

  def down
    add_reference :activities, :organizer, index: true
    add_reference :activities, :user, index: true

    add_reference :accompaniments, :activity, index: true
    add_reference :accompaniments, :friend, index: true

    add_reference :experiences, :related_to, polymorphic: true, index: true

    add_reference :learnings, :owner, index: true
    add_reference :learnings, :related_to, polymorphic: true, index: true
  end
end
