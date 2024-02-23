FactoryBot.define do
  factory :admin do
    email { 'admin@example.com' }
    password { 'password' }
    name { 'Admin User' }
    phone { '1234567890' }
    address { 'Admin Address' }
    credit_card { '1234-5678-9012-3456'}
    end
  end