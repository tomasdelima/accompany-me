require 'rails_helper'

RSpec.describe Accompaniment, type: :model do
  it { should belong_to :friend }
  it { should belong_to :activity }
  it { should validate_presence_of :subject }
  it { should have_many :learnings }
end
