class CreateActivitiesUsers < ActiveRecord::Migration
  def up
    drop_table :activities_friends

    create_table :activities_users do |t|
      t.belongs_to :activity
      t.belongs_to :user
    end
  end

  def down
    drop_table :activities_users

    create_table :activities_friends do |t|
      t.belongs_to :activity
      t.belongs_to :friend
    end
  end
end
