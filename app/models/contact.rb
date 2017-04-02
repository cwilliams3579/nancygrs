class Contact <  ApplicationRecord #ActionMailer::Base
  # validates :name,  presence: true
  # validates :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  # validates :message, presence: true
  # validates :number, presence: true

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject, body: email.body
    )

    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment, description: email.subject
        })
      end
    end
  end
end
