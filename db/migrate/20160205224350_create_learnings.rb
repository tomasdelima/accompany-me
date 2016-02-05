class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.text :description
      t.date :occurrence_date

      t.timestamps
    end
  end
end
