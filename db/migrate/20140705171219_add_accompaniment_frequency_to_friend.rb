class AddAccompanimentFrequencyToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :accompaniment_frequency, :integer
  end
end
