class Contact < MailForm::Base
  attributes :name,  :validate => true
  attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :type,  :validate => ["General", "Interface bug"]
  attributes :message
  attributes :number
  attributes :screenshot, :attachment => true, :validate => :interface_bug?
  attributes :nickname,   :captcha => true


  def headers
    {
      :subject => "Contact Form",
      :to => "clevelandwilliams3579@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
  def interface_bug?
    if type == 'Interface bug' && screenshot.nil?
      self.errors.add(:screenshot, "can't be blank on interface bugs")
    end
  end
end
