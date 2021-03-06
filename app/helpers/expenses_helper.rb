# frozen_string_literal: true

module ExpensesHelper
  def invoice_link(url)
    url.blank? ? 'Indefinido' : link_to('Link', url, target: '_blank')
  end
end
