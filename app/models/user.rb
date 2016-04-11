class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :profile
  after_create :create_profile
  after_create :send_welcome_email

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  private
  define_method :create_profile do
    self.create_profile!

    PendingInvite.all.each do |pi|
      if pi.invite_email == self.email
        proj = Project.find(pi.project_id)
        self.profile.projects.push proj
        self.profile.save
        PendingInvite.destroy(pi.id)
        break
      end
    end
  end

  define_method :send_welcome_email do
    mail = ContactMailer.send_welcome_email self
    mail.deliver_now
  end
end
