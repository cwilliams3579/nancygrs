class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  paginates_per 5
end
