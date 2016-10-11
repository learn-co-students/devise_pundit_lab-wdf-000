FactoryGirl.define do
  
  factory :note do
    content "Note Test Content!"
    association :user, factory: :user
  end

end