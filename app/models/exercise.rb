class Exercise < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_votable
  # ratyrate_rateable "title"
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, :workout, :workout_date, presence: true
  validates_numericality_of :duration_in_min, :on => :create, presence: true
  validates_presence_of :image
  validate :image_size

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end
