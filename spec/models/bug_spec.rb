require 'rails_helper'

RSpec.describe Bug, type: :model do
  it { should belong_to :profile }
end
