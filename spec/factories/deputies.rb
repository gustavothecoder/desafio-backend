# frozen_string_literal: true

FactoryBot.define do
  factory :deputy do
    name { 'deputy' }
    deputy_id { 34 }
    card_number { '023984' }
    federal_id { '82934923849' }
    state { 'SP' }
    political_party { 'BLA' }
    legislature { build(:legislature) }
  end
end
