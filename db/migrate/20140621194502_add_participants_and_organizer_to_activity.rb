class AddOrganizerToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :organizer, index: true
  end
end
