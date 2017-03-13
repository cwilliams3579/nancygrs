class Review < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates :comment, :presence => true, :length => { :minimum => 10 }
  validates_numericality_of :rating, :on => :create, presence: true 
end
