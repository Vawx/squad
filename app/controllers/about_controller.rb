class AboutController < ApplicationController
  define_method :index do
    ContactMailer.send_email current_user, 'altck8@gmail.com', 'test'
  end
end
