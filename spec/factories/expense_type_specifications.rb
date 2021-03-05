# frozen_string_literal: true

FactoryBot.define do
  factory :expense_type_specification do
    description { 'desc' }
    expense_type { build(:expense_type) }
  end
end
