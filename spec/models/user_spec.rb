require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :profile }

  it 'creates a user profile on init' do
    user = create(:user)
    expect(user.profile).to be_truthy
  end

  it 'sends an email' do
    user = create(:user)
    mail = ContactMailer.send_email user, 'altck8@gmail.com', 'rspec'
    mail.deliver_now
    expect(ActionMailer::Base.deliveries.length).to be > 0
  end
end
