require 'rails_helper'
require 'helpers/helpers_spec'

describe 'user sees content at issues page' do
  it 'changes issue to closed' do
    login_create_project_and_issue_then_close_issue
    expect(page).to have_content("Test Project")
  end
  it 'changes issue to opened' do
    user = login_create_project_and_issue_then_close_issue
    visit profile_project_issue_path( user.profile, Project.all[0], Issue.all[0] )
    click_link 'openIssue'
    expect(page).to have_content("This is a test bug...")
  end
  it 'transfers issue' do
    user = login_create_project_and_issue
    issue = Issue.all[0]
    visit profile_project_issue_path( user.profile, Project.all[0], Issue.all[0] )
    page.all(".tranferForm", :visible => true)
    click_button 'Transfer'
    expect(page).to have_content("Successfully sent issue to:")
  end
  it 'updates issues' do
    user = login_create_project_and_issue
    issue = Issue.all[0]
    visit profile_project_issue_path( user.profile, Project.all[0], Issue.all[0] )
    page.all(".updateForm", :visible => true)
    click_button 'Update'
    expect(page).to have_content("Test Project")
  end
end
