# frozen_string_literal: true

class Legislature < ApplicationRecord
  has_many :deputies, dependent: :destroy
end
