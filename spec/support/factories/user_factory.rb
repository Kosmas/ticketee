FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "uniquename#{n}" }
    sequence(:email) {|n| "uniquename#{n}@test.test" }
    password "password"
    password_confirmation "password"
  end
end