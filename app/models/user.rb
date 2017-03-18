class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
   self.first_name + " " + self.last_name
  end
end
