class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :workout
      t.integer :duration_in_min
      t.date :workout_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
