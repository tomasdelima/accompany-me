require 'rails_helper'

RSpec.describe Learning, type: :model do
  it { should belong_to :related_to }
end
