class ContactMailer < ActionMailer::Base
  default from: "altck8@gmail.com"

  def send_welcome_email(user)
    @user = user
    subject= "Welcome to SQUAD!"
    mail(to: user.email, subject: subject )
  end

  def send_invite_email (user, to)
    @user = user
    subject = "You have been invited to SQUAD!"
    mail(to: to, subject: subject)
  end
end
