FactoryBot.define do 
  factory :user do 
    firstname { 'First' }
    lastname { 'Last' }
    email { 'user@valid.com' }
    password { 'valid' }
  end
  
  factory :seller do
    firstname { 'First' }
    lastname { 'Last' }
    email { 'seller@valid.com' }
    password { 'valid' }
    seller { true }
  end
end
