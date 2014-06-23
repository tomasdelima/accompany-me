class CreateAccompaniments < ActiveRecord::Migration
  def change
    create_table :accompaniments do |t|
      t.references :activity, index: true
      t.references :friend, index: true
      t.datetime :date_time
      t.string :place
      t.string :subject
      t.text :plans
      t.text :achievements
      t.text :observations

      t.timestamps
    end
  end
end
