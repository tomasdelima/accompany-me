FactoryGirl.define do
  factory :learning, class: Learning do
    association :owner, factory: :user

    description { "Description of learning #{rand 1000}" }
  end
end