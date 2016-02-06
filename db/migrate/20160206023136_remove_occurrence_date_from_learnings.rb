class RemoveOccurrenceDateFromLearnings < ActiveRecord::Migration
  def change
    remove_column :learnings, :occurrence_date, :string
  end
end
