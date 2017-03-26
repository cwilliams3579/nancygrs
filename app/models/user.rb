class User < ApplicationRecord
  include MailForm::Delivery
  acts_as_voter
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # append :remote_ip, :user_agent, :session
  # attributes :name, :email, :created_at

  def headers
    {
      :to => "clevelandwilliams3579@gmail.com",
      :subject => "User created an account"
    }
  end

  def full_name
   self.first_name + " " + self.last_name
  end

  validate :password_complexity
   def password_complexity
      if password.present? and not password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/)
          errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
      end
   end
end
