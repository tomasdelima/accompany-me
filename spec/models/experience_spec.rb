require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { should_not be_activitable }
  it { should_not be_accompaniable }
  it { should_not be_experienceable }
  it { should be_learnable }

  it { should belong_to :experienceable }

  it { should have_many :learnings }
end
