# frozen_string_literal: true

module Courses
  # Get all courses registered in the system
  class ListCoursesAction < Action
    result :courses

    def perform
      courses = CourseRepository.new.all
      result.success(courses: courses)
    end
  end
end
