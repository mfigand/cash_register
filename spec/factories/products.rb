# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'MyString' }
    code { 'MyString' }
    price { '9.99' }
  end
end
