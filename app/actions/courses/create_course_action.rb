# frozen_string_literal: true

module Courses
  # Create a new course in the system
  class CreateCourseAction < Action
    result :course

    def perform(input)
      if input.valid?
        course = CourseRepository.new.create(input)
        result.success(course: course)
      else
        result.failure(input.errors)
      end
    rescue Errors::CourseInvalid => e
      result.failure(e.errors)
    end
  end
end
