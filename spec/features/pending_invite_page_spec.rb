require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the pending invite path' do
  it 'can go to pending invite page' do
    login_create_project_send_invite
    expect(page).to have_content("You have an invite to join Test Project from:")
  end
  it 'can join from a pending invite' do
    login_create_project_send_invite
    click_link "joinPending"
    expect(page).to have_content("Test Project")
  end
  it 'can ignore a pending invite' do
    login_create_project_send_invite
    click_link "ignorePending"
    expect(page).to have_content("Welcome to SQUAD")
  end
end
