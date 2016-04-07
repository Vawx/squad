require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to :profile }
end
