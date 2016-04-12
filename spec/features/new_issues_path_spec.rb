require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the user create issue path' do
  it 'creates a new issue' do
    login_create_project
    click_link 'newIssueButton'
    click_button 'Create'
    expect(Issue.all.length).to be > 0
  end
end
