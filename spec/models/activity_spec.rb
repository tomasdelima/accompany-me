require 'rails_helper'

describe Activity, type: :model do
  it { should_not be_activitable }
  it { should be_accompaniable }
  it { should be_experienceable }
  it { should be_learnable }

  it { should belong_to :activitable }

  it { should have_many :accompaniments }
  it { should have_many :experiences }
  it { should have_many :learnings }

  xit { should have_and_belong_to_many :participants }
end
