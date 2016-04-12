require 'rails_helper'
require 'helpers/helpers_spec'

describe 'admin send invite path' do
  it 'admin can send an invite to email' do
    login_create_project
    admin_send_invite
    expect(PendingInvite.all.length).to be > 0
  end
  it 'checks admin cant send double invites to same user of project' do
    login_create_project
    click_link 'Admin'
    fill_in 'invite_address', with: "supertest@test.com"
    click_button 'Send Invite'
    expect(PendingInvite.first.invite_email).to eq("supertest@test.com")
  end
end
