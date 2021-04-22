# frozen_string_literal: true

module Courses
  # Delete a course from the system
  class DeleteCourseAction < Action
    def perform(id)
      CourseRepository.new.delete(id)
      result.success
    end
  end
end
