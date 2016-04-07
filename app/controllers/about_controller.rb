class AboutController < ApplicationController
  define_method :index do
    mail = ContactMailer.send_email current_user, 'altck8@gmail.com', 'test'
    mail.deliver_now
  end
end
