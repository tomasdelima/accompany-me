FactoryGirl.define do
  factory :activity, class: Activity do
    association :activitable, factory: :user

    name                    { "Activity #{rand 1000}" }
    frequency               { 7 }
    accompaniment_frequency { 14 }
  end
end