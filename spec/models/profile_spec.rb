
require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to :user }
  it { have_and_belong_to_many :projects }
end
