require 'rails_helper'

RSpec.describe AbstractModel do

  let(:accompaniment) { FactoryGirl.create :accompaniment }
  let(:activity)      { FactoryGirl.create :activity }
  let(:experience)    { FactoryGirl.create :experience }
  let(:friend)        { FactoryGirl.create :friend }
  let(:friendship)    { FactoryGirl.create :friendship }
  let(:learning)      { FactoryGirl.create :learning }
  let(:user)          { FactoryGirl.create :user }

  let(:objects) {
    [accompaniment, activity, experience, friend, learning, user]
  }

  describe '#show_fields' do
    it 'returns the fields to be shown in the views, with the correct parameters' do
      objects.each do |object|
        object.show_fields.each do |field|
          expect(field).to include(:name)
          expect(field).to include(:type)
          expect(field).to include(:options)
        end
      end
    end
  end

  describe '#class_name' do
    it 'returns the translated model name' do
      objects.each do |object|
        expect(object).to respond_to :class_name
        expect(object.class_name).to be_present
      end
    end
  end
end
