# frozen_string_literal: true

# TODO: Ver otro sitio para dejar estos errores
module Errors
  # Base exception class
  class BaseException < StandardError
    attr_reader :errors

    def initialize(message, errors)
      super(message)
      @errors = errors.is_a?(Enumerable) ? errors : [errors]
    end
  end

  class CourseInvalid < BaseException; end

  class ProposedCourseInvalid < BaseException; end
end
