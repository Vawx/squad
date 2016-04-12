class AdminController < ApplicationController

  define_method :index do
    @project = Project.find(params[:project_id])
    @sending_error = ""
    @sending_message = ""
  end

  define_method :create do
    @project = Project.find(params[:project_id])
    @sending_error = ""
    @sending_message = ""
    email = params[:invite_address]
    if email.length > 0
      alreadyExists = false
      if email != current_user.email
        PendingInvite.all.each do |pi|
          if pi.invite_email == email && pi.sent_email == current_user.email
            alreadyExists = true
          end
        end

        if !alreadyExists
          mail = ContactMailer.send_invite_email(current_user, email)
          mail.deliver_now

          pending = PendingInvite.new
          pending.project_id = @project.id
          pending.invite_email = ApplicationHelper::to_lower(email)
          pending.sent_email = current_user.email

          pending.save( )

          @sending_message = "Successfully invited: " + email
        else
          @sending_error = "Invite has already been sent to user."
        end
      else
        @sending_error = "You cannot invite yourself."
      end
    else
      @sending_error = "To send an email, enter it into the field."
    end
    render :index
  end

end
