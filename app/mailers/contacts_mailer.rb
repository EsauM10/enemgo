class ContactsMailer < ApplicationMailer
  default from: 'no-reply@enemgo.com'
  default to: 'contato@enemgo.com'

  def send_email(contact)
    @contact = contact
    mail(reply_to: @contact.email, subject: @contact.theme)
  end
end
