class AddSummaryToLearning < ActiveRecord::Migration
  def change
    add_column :learnings, :summary, :string
  end
end
