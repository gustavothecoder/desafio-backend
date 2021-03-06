# frozen_string_literal: true

class DeputyPresenter < BasePresenter
  include ApplicationHelper
  include ExpensesHelper

  def initialize(deputy)
    super(deputy)
    @highest_expense = expenses.order('net_value DESC').first
  end

  def highest_expense_net_value
    @highest_expense.net_value
  end

  def highest_expense_provider
    @highest_expense.provider
  end

  def highest_expense_issue_date
    format_time(@highest_expense.issue_date)
  end

  def highest_expense_link
    helpers.invoice_link(@highest_expense.document_url, 'aqui')
  end

  def total_spend
    expenses.sum(:net_value)
  end
end
