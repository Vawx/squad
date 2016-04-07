require 'rails_helper'

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

define_method :logout do
  puts "2093;lisdafo0[9u23;lkdsaf09u23;lsadjf09u23r;lfsd]"
  click_link 'LOUGOUTSON'
  return true
end
