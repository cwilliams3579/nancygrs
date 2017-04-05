class ContactMailer < ApplicationMailer
  default :from => "clevelandwiliams3579@gmail.com"
  default :to => "cameron3579@hotmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
end
