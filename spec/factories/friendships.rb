FactoryGirl.define do
  factory :friendship, class: Friendship do
    association :user, factory: :user
    association :friend, factory: :friend
  end
end