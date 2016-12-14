FactoryGirl.define do
  factory :consumption do
    user { FactoryGirl.create(:user) }
    sunday    { rand(11) }
    monday    { rand(11) }
    tuesday   { rand(11) }
    wednesday { rand(11) }
    thursday  { rand(11) }
    friday    { rand(11) }
    saturday  { rand(11) }
  end
end
