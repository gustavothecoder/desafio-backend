# frozen_string_literal: true

# This class help us to create presenters.
# Inherit from SimpleDelegator provides us with the means to delegate
# all supported method calls to the object passed into the constructor.
class BasePresenter < SimpleDelegator
  def initialize(object)
    super(object)
  end

  private

  # This method acts as an alias for ApplicationController.helpers and it
  # allows us to use helpers like link_to and content_tag on our presenters.
  def helpers
    ApplicationController.helpers
  end
end
