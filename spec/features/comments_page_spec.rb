require 'rails_helper'
require 'helpers/helpers_spec'

describe 'comments page' do
  it 'can add a new comment' do
    user = login_create_project_and_issue
    issue = Issue.all[0]
    visit new_profile_project_issue_comment_path(user.profile, Project.all[0], issue )
    fill_in 'comment_content', with: "Test comment"
    click_button 'New Comment'
    expect(Comment.all.length).to be > 0
  end
end
