FactoryGirl.define do
  factory :note do

    content "Am I not merciful?"

    association :user, factory: :scribe

  end


end
