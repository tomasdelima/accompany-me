class AddAccompanimentFrequencyToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :accompaniment_frequency, :integer
  end
end
