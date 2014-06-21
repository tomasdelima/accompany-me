class AddFrequencyToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :frequency, :string
  end
end
