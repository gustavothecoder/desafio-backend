# frozen_string_literal: true

class Deputy < ApplicationRecord
  belongs_to :legislature
  has_many :expenses
end
