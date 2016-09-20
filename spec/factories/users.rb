FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "Test User"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end
    trait :moderator do
      role 'moderator'
    end

    factory :scribe do
      name "Shakespear"
      email "midnight@summer.org"
      password "itsaplay"
    end

  end
end
