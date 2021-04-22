# frozen_string_literal: true

module Errors
  # Error when association data for model is not present
  class AssociationNotLoadedError < StandardError; end
end
