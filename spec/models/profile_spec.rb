
require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to :user }
  it { should have_many :issues }
  it { have_and_belong_to_many :projects }
end
