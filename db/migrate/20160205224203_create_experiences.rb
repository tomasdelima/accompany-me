class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.text :description
      t.date :occurrence_date

      t.timestamps
    end
  end
end
