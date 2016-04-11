class AdminController < ApplicationController

  define_method :index do
    @sending_error = ""
  end

  define_method :create do
    email = params[:inviteAddress]
    if email.length > 0
      #create mail->send
    else
      @sending_error = "To send an email, enter it into the field."
      render :index
    end
  end

end
