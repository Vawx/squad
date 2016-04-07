class ContactMailer < ApplicationMailer
  default from: "altck8@gmail.com"

  define_method :send_email do |user, to, subject|
    mail(to: user.email, subject: subject)
  end
end
