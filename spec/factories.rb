FactoryGirl.define do
  factory :user do

    #name "YaoCanwei"

    #email "a1248014498@gmail.com"

    #password "foobar"

    #password_confirmation "foobar"
    sequence(:name) { |n| "person #{ n }" }
    sequence(:email) { |n| "person_#{ n }@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end
