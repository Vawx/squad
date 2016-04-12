require 'rails_helper'
require 'helpers/helpers_spec'

describe 'the about path' do
  it 'checks any user can go to the about path' do
    visit about_path
    expect(page).to have_content("Squad aids development by allowing a team manager and their employees delegate and mark off tasks and bugs related to the project.")
  end
end
