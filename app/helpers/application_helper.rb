# frozen_string_literal: true

module ApplicationHelper
  def summarize_name(name)
    fragments = name.split(' ')
    fragments.count == 1 ? fragments.first : "#{fragments.first} #{fragments.last}"
  end
end
