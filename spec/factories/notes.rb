FactoryGirl.define do
  factory :note do
    content "This is just a note content"
    association :user, factory: :user
  end
end
