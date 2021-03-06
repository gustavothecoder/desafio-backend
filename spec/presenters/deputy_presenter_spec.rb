# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeputyPresenter, type: :presenter do
  let(:deputy) { create(:deputy) }
  let!(:expense) { create(:expense, net_value: 230.00, deputy: deputy) }
  let(:time) { Time.new(2020, 12, 25, 10, 24, 25) }
  let!(:other_expense) { create(:expense, issue_date: time, net_value: 270.00, deputy: deputy) }
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

  describe '#total_spend' do
    it 'should return 500.0' do
      expect(deputy_presenter.total_spend).to eq(500.0)
    end
  end
end
