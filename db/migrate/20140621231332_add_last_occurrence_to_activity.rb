class AddLastOccurrenceToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :last_occurrence, :datetime
  end
end
