FactoryGirl.define do
  factory :user, class: User do
    email    { "user.name.#{rand 100000}@email.com"}
    password { '12345678' }
  end
end