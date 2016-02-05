require 'rails_helper'

describe Activity, type: :model do
  it { should belong_to :user }
  it { should belong_to :organizer }
  it { should have_and_belong_to_many :participants }
  it { should have_many :accompaniments }
  it { should have_many :learnings }
end
