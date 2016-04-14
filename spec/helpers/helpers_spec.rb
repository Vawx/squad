require 'rails_helper'

define_method :login_custom do |email|
  logout
  user = create(:user)
  user.email = email
  visit new_user_registration_path
  fill_in 'Email', with: user.email
  fill_in 'firstPassword', with: user.password
  fill_in 'secondPassword', with: user.password
  click_button 'signUp'
  return user
end

define_method :login do
  user = create(:user)
  random = Random.new
  user.email = 'capybaratest' + random.rand(0..10000).to_s + '@test.com' # have to change this here because it tries to use a email already taken from prior test
  visit new_user_registration_path
  fill_in 'Email', with: user.email
  fill_in 'firstPassword', with: user.password
  fill_in 'secondPassword', with: user.password
  click_button 'signUp'
  return user
end

define_method :login_existing do |email|
  visit root_path
  click_link "login"
  fill_in "user_email", with: email
  fill_in "user_password", with: "passwordsz"
  click_button "Log in"
end

define_method :logout do
  visit root_path
  click_link 'logout'
  return true
end

define_method :sop do
  save_and_open_page
end

define_method :login_create_project_send_invite do
  user = login_custom("testing@testing.com")
  logout
  user = login_create_project
  visit profile_project_path( user.profile, Project.all[0])
  click_link 'Admin'
  fill_in 'invite_address', with: "testing@testing.com"
  click_button "Send Invite"
  logout
  login_existing "testing@testing.com"
  visit pending_invite_index_path
end

define_method :login_create_project do
  logout
  user = login
  visit new_profile_project_path( user.profile )
  fill_in 'projectName', with: "Test Project"
  click_button 'Create'
  return user
end

define_method :login_create_project_and_issue do
  user = login_create_project_and_issue
  return user
end

define_method :login_create_project_and_issue do
  logout
  user = login_create_project
  click_link 'newIssueButton'
  fill_in 'content_bug', with: "This is a test bug"
  click_button 'Create'
  return user
end

define_method :admin_send_invite do
  click_link 'Admin'
  fill_in 'invite_address', with: "supertest@test.com"
  click_button 'Send Invite'
end

define_method :login_create_project_and_issue_then_close_issue do
  user = login_create_project_and_issue
  issue = Issue.all[0]
  visit profile_project_issue_path(user.profile, Project.all[0], issue)
  click_link 'closeIssue'
  return user
end
