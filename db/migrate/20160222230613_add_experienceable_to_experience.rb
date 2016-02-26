class AddExperienceableToExperience < ActiveRecord::Migration
  def change
    add_reference :experiences, :experienceable, polymorphic: true, index: {name: :index_experiences_on_experienceable}
  end
end
