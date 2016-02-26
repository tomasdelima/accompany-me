class AddLearnableToLearning < ActiveRecord::Migration
  def change
    add_reference :learnings, :learnable, polymorphic: true, index: {name: :index_learnings_on_learnable}
  end
end
