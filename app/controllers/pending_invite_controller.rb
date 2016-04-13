class PendingInviteController < ApplicationController
  define_method :index do
    @pending = PendingInvite.all.where( invite_email: current_user.email )
  end
end
