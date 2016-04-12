require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the user authentication login path' do
  it 'checks that a new user can create a project' do
    login
    click_link 'projectsLink'
    expect(page).to have_content("New Project")
  end
end
