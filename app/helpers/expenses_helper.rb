# frozen_string_literal: true

module ExpensesHelper
  def invoice_link(url, link_text = 'Link')
    url.blank? ? 'Indefinido' : link_to(link_text, url, target: '_blank')
  end
end
