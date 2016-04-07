require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the user authentication login path' do
  it 'allows a user to sign in' do
    login
    expect(page).to have_content('Logout')
  end
end
