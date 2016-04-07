require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_one :user }
  it { should have_and_belong_to_many :profiles }

end
