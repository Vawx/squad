require 'rails_helper'

RSpec.describe Issue, type: :model do
  it { should belong_to :profile }
  it { should have_many :comments }
end
