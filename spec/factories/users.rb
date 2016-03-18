FactoryGirl.define do
  factory :user, class: User do
    email                 { "user.name.#{rand 100000}@email.com"}
    password              { '12345678' }
    password_confirmation { password }
  end
end