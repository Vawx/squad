require 'rails_helper'

RSpec.describe Issue, type: :model do
  it { should belong_to :profile }
end
