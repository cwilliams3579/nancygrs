class Exercise < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, :workout, :workout_date, presence: true
  validates_numericality_of :duration_in_min, :on => :create, presence: true 
end
