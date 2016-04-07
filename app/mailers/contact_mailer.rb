class ContactMailer < ActionMailer::Base
  default from: "altck8@gmail.com"

  def send_email( user, to, subject )
    @user = user
    mail(to: user.email, subject: subject )
  end
end
