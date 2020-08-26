FactoryBot.define do 
  factory :product do 
    seller
    name { 'Product' }
    quantity { 100 }
    code { 'CODE100' }
  end
end
