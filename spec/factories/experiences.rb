FactoryGirl.define do
  factory :experience, class: Experience do
    association :experienceable, factory: :user

    description { "Experience #{rand 1000}" }
  end
end