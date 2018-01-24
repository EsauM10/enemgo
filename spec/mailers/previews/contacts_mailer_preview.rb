# Preview all emails at http://localhost:3000/rails/mailers/contacts_mailer
class ContactsMailerPreview < ActionMailer::Preview
  def send_email
    ContactsMailer.send_email(Contact.first)
  end
end
