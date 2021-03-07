# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    document_number { '982374' }
    provider { 'provider' }
    federal_id { '023984923482' }
    kind { 0 }
    issue_date { Time.current }
    document_value { 923.32 }
    gloss_value { 0.0 }
    net_value { 923.32 }
    month { 12 }
    year { 2020 }
    portion { 0 }
    passenger { 'bla' }
    part { 'bla' }
    batch { '234' }
    refund { '234' }
    restitution { '324' }
    document_url { 'https://www.example.com' }
    expense_type { build(:expense_type) }
    deputy { build(:deputy) }
  end
end
