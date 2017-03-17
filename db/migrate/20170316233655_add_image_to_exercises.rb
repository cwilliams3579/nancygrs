class AddImageToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :image, :string
  end
end
