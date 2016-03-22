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

  it { should have_and_belong_to_many :participants }

  describe '#next_occurrence' do
    let(:activity) { FactoryGirl.build :activity, frequency: frequency, last_occurrence: Date.new(2000, 1, 1) }

    context 'when its frequency is daily' do
      let(:frequency) { 'diario' }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to eq Date.new(2000, 1, 2)
      end
    end

    context 'when its frequency is weekly' do
      let(:frequency) { 'semanal' }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to eq Date.new(2000, 1, 8)
      end
    end

    context 'when its frequency is biweekly' do
      let(:frequency) { 'bisemanal' }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to eq Date.new(2000, 1, 15)
      end
    end

    context 'when its frequency is monthly' do
      let(:frequency) { 'mensal' }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to eq Date.new(2000, 2, 1)
      end
    end

    context 'when its frequency is trimonthly' do
      let(:frequency) { 'trimestral' }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to eq Date.new(2000, 4, 1)
      end
    end

    context 'when its frequency is anual' do
      let(:frequency) { 'anual' }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to eq Date.new(2001, 1, 1)
      end
    end

    context 'when it has no frequency' do
      let(:frequency) { nil }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to be_falsy
      end
    end

    context 'when it has never happened' do
      let(:frequency) { nil }

      before { activity.last_occurrence = nil }

      it 'returns the next date of occurrence' do
        expect(activity.next_occurrence).to be_falsy
      end
    end
  end
end
