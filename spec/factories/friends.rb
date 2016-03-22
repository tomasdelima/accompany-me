FactoryGirl.define do
  factory :friend, class: Friend do
    email { "friend.name.#{rand 100000}@email.com"}
  end
end