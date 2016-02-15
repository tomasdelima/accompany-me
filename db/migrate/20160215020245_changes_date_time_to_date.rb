class ChangesDateTimeToDate < ActiveRecord::Migration
  def up
    change_column :accompaniments, :date_time, :date
    change_column :activities, :last_occurrence, :date
    change_column :activities, :last_accompanied, :date
  end

  def down
    change_column :accompaniments, :date_time, :datetime
    change_column :activities, :last_occurrence, :datetime
    change_column :activities, :last_accompanied, :datetime
  end
end
