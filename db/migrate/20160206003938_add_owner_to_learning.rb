class AddOwnerToLearning < ActiveRecord::Migration
  def change
    add_reference :learnings, :owner, index: true
  end
end
