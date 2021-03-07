# frozen_string_literal: true

module ApplicationHelper
  def summarize_name(name)
    fragments = name.split(' ')
    fragments.count == 1 ? fragments.first : "#{fragments.first} #{fragments.last}"
  end

  def format_time(time, format = '%d/%m/%y')
    time.nil? ? 'Indefinida' : time.strftime(format)
  end
end
