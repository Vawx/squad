require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the admin send invite path' do
  it 'creates and sends an email to a user' do
    user = login
    visit new_profile_project_path(user.profile)
    fill_in 'projectName', with: "TestProject"
    click_button 'Create'
    click_link 'Admin'
    within("//div[@id='form']") do
      fill_in 'invite_address', with: "test@testing.com"
    end
    open_page
    click_button 'Send Invite'
    expect(PendingInvite.all.length).to eq(1)
  end
end
