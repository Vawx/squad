require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the admin send invite path' do
  it 'creates and sends an email to a user' do
    user = login
    visit new_profile_project_path(user.profile)
    send_invite
    expect(PendingInvite.all.length).to eq(1)
  end
  it 'sends invite to self' do
    user = login_custom "test@testing.com"
    visit new_profile_project_path(user.profile)
    send_invite
    expect(page).to have_content("You cannot invite yourself")
  end
  it 'sends two invites to one person' do
    user = login_custom "supertest@testing.com"
    visit new_profile_project_path(user.profile)
    send_invite
    visit new_profile_project_path(user.profile)
    send_invite
    expect(page).to have_content("Invite has already been sent to user")
  end
  it 'tries to send invite with no email in field' do
    user = login
    visit new_profile_project_path(user.profile)
    fill_in 'projectName', with: "TestProject"
    click_button 'Create'
    click_link 'Admin'
    click_button 'Send Invite'
    expect(page).to have_content("To send an email, enter it into the field")
  end
end
