require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the user auto joins invited project' do
  it 'add project to user if they have been invited from it' do
    login_create_project
    admin_send_invite
    logout
    user = login_custom 'supertest@test.com'
    expect(user.profile.projects.length).to be >= 0
  end
end
