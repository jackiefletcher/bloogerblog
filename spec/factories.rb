FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@example.com" }
    password('12345678')
  end

  factory :post do
    title('Tennies')
    content('kicks fo yo feet.')
  end

  factory :comment do
    text('That sounds so cool, thanks for sharing.')
  end

end
