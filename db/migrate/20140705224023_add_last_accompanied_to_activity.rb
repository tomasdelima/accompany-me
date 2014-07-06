class AddLastAccompaniedToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :last_accompanied, :datetime
  end
end
