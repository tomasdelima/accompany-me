class AddRelatedToToExperience < ActiveRecord::Migration
  def change
    add_reference :experiences, :related_to, polymorphic: true, index: true
  end
end
