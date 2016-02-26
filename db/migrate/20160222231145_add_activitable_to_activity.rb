class AddActivitableToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :activitable, polymorphic: true, index: {name: :activities_on_activitable}
  end
end
