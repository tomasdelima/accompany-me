class AddRelatedToToLearning < ActiveRecord::Migration
  def change
    add_reference :learnings, :related_to, polymorphic: true, index: true
  end
end
