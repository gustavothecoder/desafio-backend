# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesHelper, type: :helper do
  include ExpensesHelper

  describe '#invoice_link' do
    context 'when the expense has the document url' do
      it 'should return a HTML a element' do
        expense = build(:expense)
        expect(invoice_link(expense.document_url)).to eq('<a target="_blank" href="https://www.example.com">Link</a>')
      end
    end

    context 'when the expense does not have the document url' do
      it 'should return: Indefinido' do
        expense = build(:expense, document_url: nil)
        expect(invoice_link(expense.document_url)).to eq('Indefinido')
      end
    end
  end
end
