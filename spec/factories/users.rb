FactoryGirl.define do
  factory :user, class: User do
    email                 { "user.name.#{rand 100000}@email.com"}
    password              { '12345678' }
    password_confirmation { password }

    trait :with_one_friend do
      after(:create) do |user, evaluator|
        friend = FactoryGirl.create(:friend)
        Friendship.create(user: user, friend: friend)
      end
    end
  end
end