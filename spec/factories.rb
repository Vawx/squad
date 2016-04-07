include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence :email do |e|
      "test-#{e}@email.com"
    end
    password 'passwordsz'
  end

  factory :profile do
    user
  end
end
