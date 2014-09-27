FactoryGirl.define do
  factory :friend, class: Friend do
    association :user, factory: :user

    name                    { "Friend #{rand 1000}" }
    declared                { false }
    last_accompanied        { rand(30).days.ago }
    accompaniment_frequency { rand 30 }
  end
end