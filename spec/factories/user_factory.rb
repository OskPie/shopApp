FactoryBot.define do 
  factory :user do 
    firstname { 'First' }
    lastname { 'Last' }
    email { 'user@valid.com' }
    password { 'valid' }
  end
end
