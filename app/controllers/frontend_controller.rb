class FrontendController < ApplicationController
  define_method :index do
    if current_user.class != NilClass
      invites = PendingInvite.all.where(invite_email: current_user.email)
      if invites.class != NilClass
        @hasPendingInvite = invites.length > 0
      end
    end
  end
end
