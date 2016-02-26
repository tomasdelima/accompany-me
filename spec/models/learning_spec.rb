require 'rails_helper'

RSpec.describe Learning, type: :model do
  it { should_not be_activitable }
  it { should_not be_accompaniable }
  it { should_not be_experienceable }
  it { should_not be_learnable }

  it { should belong_to :learnable }
end
