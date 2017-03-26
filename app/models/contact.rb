class Contact < MailForm::Base
  include MailForm::Delivery
  attributes :name,  :validate => true
  attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message
  attributes :number
  attributes :nickname,   :captcha => true


  def headers
    {
      :subject => "Contact Form",
      :to => "clevelandwilliams3579@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
