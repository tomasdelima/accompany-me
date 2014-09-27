FactoryGirl.define do
  factory :accompaniment, class: Accompaniment do

    place        { "My place" }
    subject      { "Sample subject" }
    plans        { "Some plans" }
    achievements { "Some achievementsts" }
    observations { "Some observations" }
  end
end