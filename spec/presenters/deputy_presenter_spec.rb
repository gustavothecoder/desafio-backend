# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeputyPresenter, type: :presenter do
  let(:deputy) { create(:deputy) }
  let!(:expense) do
    create(:expense, provider: 'blabla', net_value: 230.00, document_url: 'https://www.bla.com', deputy: deputy)
  end
  let(:time) { Time.new(2020, 12, 25, 10, 24, 25) }
  let!(:other_expense) { create(:expense, provider: 'provider', issue_date: time, net_value: 270.00, deputy: deputy) }
  let(:deputy_presenter) { DeputyPresenter.new(deputy) }

  describe '#highest_expense_net_value' do
    it 'should return 270.0' do
      expect(deputy_presenter.highest_expense_net_value).to eq(270.0)
    end
  end

  describe '#highest_expense_provider' do
    it 'should return provider' do
      expect(deputy_presenter.highest_expense_provider).to eq('provider')
    end
  end

  describe '#highest_expense_issue_date' do
    it 'should return 25/12/20' do
      expect(deputy_presenter.highest_expense_issue_date).to eq('25/12/20')
    end
  end

  describe '#highest_expense_link' do
    it 'should return the invoice link' do
      expect(deputy_presenter.highest_expense_link).to eq('<a target="_blank" href="https://www.example.com">aqui</a>')
    end
  end

  describe '#total_spend' do
    it 'should return 500.0' do
      expect(deputy_presenter.total_spend).to eq(500.0)
    end
  end
end
