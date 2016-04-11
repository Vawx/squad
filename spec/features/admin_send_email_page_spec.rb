require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the admin send invite path' do
  it 'creates and sends an email to a user' do
    user = login
    visit new_profile_project_path(user)
    fill_in 'projectName', with: "TestProject"
    click_button 'Create'
    click_link 'Admin'
    fill_in 'inviteAddress', with: "test@test.com"
    click_button 'Send Invite'
    expect(PendingInvite.all.length).to eq(1)
  end
end


=begin
visit new_profile_project_path(user)
fill_in 'projectName', with: "TestProject"
click_button 'Create'
click_link 'Admin'
fill_in 'inviteAddress', with: "test@test.com"
open_page
binding.pry
click_button 'Send Invite'
=end
