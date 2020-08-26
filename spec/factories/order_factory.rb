FactoryBot.define do 
  factory :order do 
    user
    product
    amount { 1 }
  end
end
