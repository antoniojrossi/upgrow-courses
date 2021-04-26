# frozen_string_literal: true

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

  class VoteInvalid < BaseException; end
end
