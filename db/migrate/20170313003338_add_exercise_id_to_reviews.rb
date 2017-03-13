class AddExerciseIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :exercise_id, :integer
  end
end
