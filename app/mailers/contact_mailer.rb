class ContactMailer < ApplicationMailer
  def submit_metadata
    mail(to: ENV["MAILER_RECIPIENT"], subject: 'Ocean+ Library metadata submission')
  end
end