class CreateTestimonials < ActiveRecord::Migration[5.0]
  def change
    create_table :testimonials do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
