require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { should have_many :learnings }
end
