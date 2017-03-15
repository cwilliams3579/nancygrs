class Exercise < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, :workout, :workout_date, presence: true
  validates_numericality_of :duration_in_min, :on => :create, presence: true
  validates_presence_of :image
  validate :image_size  

  private

  def image_size
    if image.size > 10.megabytes
      errors.add(:image, "should be less than 10MB")
    end
  end 
end