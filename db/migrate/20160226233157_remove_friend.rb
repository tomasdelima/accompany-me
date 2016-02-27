class RemoveFriend < ActiveRecord::Migration
  def up
    drop_table :friends
  end

  def down
    create_table :friends do |t|
      t.integer  :user_id
      t.string   :name
      t.boolean  :declared
      t.date     :last_accompanied
      t.integer  :accompaniment_frequency

      t.timestamps
    end
  end
end
