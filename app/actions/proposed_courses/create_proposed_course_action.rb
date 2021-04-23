# frozen_string_literal: true

module ProposedCourses
  # Create a new proposed course in the system
  class CreateProposedCourseAction < Action
    result :proposed_course

    def perform(input)
      if input.valid?
        proposed_course = ProposedCourseRepository.new.create(input)
        result.success(proposed_course: proposed_course)
      else
        result.failure(input.errors)
      end
    rescue Errors::ProposedCourseInvalid => e
      result.failure(e.errors)
    end
  end
end
