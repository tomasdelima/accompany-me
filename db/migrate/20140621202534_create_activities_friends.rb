class CreateActivitiesFriends < ActiveRecord::Migration
  def change
    create_table :activities_friends, id: false do |t|
      t.belongs_to :activity
      t.belongs_to :friend
    end
  end
end
