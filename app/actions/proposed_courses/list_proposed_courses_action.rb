# frozen_string_literal: true

module ProposedCourses
  # Get all proposed courses registered in the system
  class ListProposedCoursesAction < Action
    result :proposed_courses

    def perform
      proposed_courses = ProposedCourseRepository.new.all_with_course_and_teacher
      result.success(proposed_courses: proposed_courses)
    end
  end
end
